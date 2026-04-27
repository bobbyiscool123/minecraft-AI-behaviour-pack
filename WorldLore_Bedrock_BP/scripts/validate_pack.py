#!/usr/bin/env python3
import json
import pathlib
import re
import sys

BP = pathlib.Path(__file__).resolve().parents[1]
problems = []

manifest = BP / 'manifest.json'
if not manifest.exists():
    problems.append('manifest.json missing at pack root')
else:
    m = json.loads(manifest.read_text())
    if m.get('format_version') != 2:
        problems.append('manifest format_version must be 2')
    if m.get('modules', [{}])[0].get('type') != 'data':
        problems.append('first module type must be data')
    if 'dependencies' in m:
        problems.append('resource/dependency section not allowed for PR1')

for p in BP.rglob('*.json'):
    try:
        json.loads(p.read_text())
    except Exception as e:
        problems.append(f'json parse failed: {p}: {e}')

tick = BP / 'functions' / 'tick.json'
if not tick.exists():
    problems.append('functions/tick.json missing')
else:
    vals = json.loads(tick.read_text()).get('values', [])
    if len(vals) != 1:
        problems.append('tick.json should call one root function')
    for ref in vals:
        f = BP / 'functions' / f'{ref}.mcfunction'
        if not f.exists():
            problems.append(f'tick references missing function: {ref}')

required = [
    'functions/wl/setup.mcfunction',
    'functions/wl/runtime/tick.mcfunction',
    'functions/wl/place/assign_dna.mcfunction',
    'functions/wl/anchor/create_candidate.mcfunction',
    'functions/wl/arc/select.mcfunction',
    'functions/wl/messages/select.mcfunction',
]
for rel in required:
    if not (BP / rel).exists():
        problems.append(f'missing required core function: {rel}')

for p in BP.rglob('*'):
    if p.is_file() and p.suffix.lower() in {'.jar', '.java', '.kt', '.gradle'}:
        problems.append(f'forbidden java/mod artifact file: {p}')

for p in BP.rglob('*.mcfunction'):
    txt = p.read_text().lower()
    if ' summon wither' in txt or ' summon ender_dragon' in txt:
        problems.append(f'forbidden summon in {p}')
    if 'fill ' in txt and ' 20' in txt:
        problems.append(f'possible large fill operation in {p}')

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
