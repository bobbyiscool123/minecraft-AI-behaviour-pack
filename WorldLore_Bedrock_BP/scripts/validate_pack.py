#!/usr/bin/env python3
import json
import pathlib
import re
import sys

BP = pathlib.Path(__file__).resolve().parents[1]

problems = []
manifest_paths = list(BP.rglob('manifest.json'))
if not manifest_paths:
    problems.append('manifest.json missing')
if len([p for p in manifest_paths if p.parent == BP]) == 0:
    problems.append('manifest must be at behavior pack root')
if len(manifest_paths) != 1:
    problems.append(f'exactly one manifest required in pack, found {len(manifest_paths)}')

manifest = BP / 'manifest.json'
if manifest.exists():
    m = json.loads(manifest.read_text())
    blob = json.dumps(m)
    if 'dependencies' in m:
        problems.append('resource/dependency section not allowed for PR1')
    if re.search(r'https?://', blob, re.I):
        problems.append('backend URL-like string in manifest')

for p in BP.rglob('*.json'):
    try:
        json.loads(p.read_text())
    except Exception as e:
        problems.append(f'json parse failed: {p}: {e}')

tick = BP / 'functions' / 'tick.json'
if not tick.exists():
    problems.append('functions/tick.json missing')
else:
    t = json.loads(tick.read_text())
    for ref in t.get('values', []):
        f = BP / 'functions' / (ref + '.mcfunction')
        if not f.exists():
            problems.append(f'tick references missing function: {ref}')

for p in BP.rglob('*'):
    if p.is_file() and p.suffix.lower() in {'.jar', '.java', '.kt', '.gradle'}:
        problems.append(f'forbidden java/mod artifact file: {p}')

generated = BP / 'functions' / 'wl' / 'generated'
for p in generated.glob('*.mcfunction'):
    if p.name != p.name.lower():
        problems.append(f'generated filename must be lowercase: {p.name}')
    cmds = [l for l in p.read_text().splitlines() if l and not l.startswith('#')]
    if len(cmds) > 30:
        problems.append(f'generated function too large: {p.name}')

if len(list(generated.glob('*.mcfunction'))) > 400:
    problems.append('PR1 archive dump too large')

print(json.dumps({'problems': problems}, indent=2))
sys.exit(1 if problems else 0)
