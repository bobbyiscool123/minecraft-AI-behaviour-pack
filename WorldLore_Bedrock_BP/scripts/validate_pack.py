#!/usr/bin/env python3
import json
import pathlib
import sys

BP = pathlib.Path(__file__).resolve().parents[1]
problems = []

manifest = BP / 'manifest.json'
if not manifest.exists():
    problems.append('manifest.json missing at pack root')
else:
    try:
        m = json.loads(manifest.read_text())
        if m.get('format_version') != 2:
            problems.append('manifest format_version must be 2')
        if not m.get('modules'):
            problems.append('manifest modules missing')
        if any(mod.get('type') != 'data' for mod in m.get('modules', [])):
            problems.append('all modules must be data for this BP')
        if 'dependencies' in m:
            problems.append('resource pack dependency not allowed in PR1')
    except Exception as exc:
        problems.append(f'manifest parse failed: {exc}')

for p in BP.rglob('*.json'):
    try:
        json.loads(p.read_text())
    except Exception as exc:
        problems.append(f'json parse failed: {p}: {exc}')

tick = BP / 'functions' / 'tick.json'
if not tick.exists():
    problems.append('functions/tick.json missing')
else:
    refs = json.loads(tick.read_text()).get('values', [])
    for ref in refs:
        fn = BP / 'functions' / f'{ref}.mcfunction'
        if not fn.exists():
            problems.append(f'tick references missing function: {ref}')

generated = BP / 'functions' / 'wl' / 'generated'
largest_commands = 0
for p in generated.glob('*.mcfunction'):
    if p.name != p.name.lower():
        problems.append(f'generated name must be lowercase: {p.name}')
    lines = [ln.strip() for ln in p.read_text().splitlines() if ln.strip() and not ln.startswith('#')]
    largest_commands = max(largest_commands, len(lines))
    if len(lines) > 30:
        problems.append(f'generated command budget exceeded (>30): {p.name}')

if len(list(generated.glob('*.mcfunction'))) > 400:
    problems.append('PR1 generated archive too large')

scan_targets = [
    p for p in BP.rglob('*')
    if p.is_file() and p.suffix in {'.mcfunction'}
]
scan_blob = '\n'.join(p.read_text(errors='ignore') for p in scan_targets).lower()
for forbidden in ['http://', 'https://', 'api key', 'resource_pack']:
    if forbidden in scan_blob:
        problems.append(f'forbidden token detected: {forbidden}')

after_dir = BP / 'functions' / 'wl' / 'after'
for p in after_dir.glob('*.mcfunction'):
    txt = p.read_text().lower()
    for bad in ['lava', 'tnt', 'summon wither', 'summon ender_dragon', 'fill ~ ~ ~ ~20']:
        if bad in txt:
            problems.append(f'unsafe aftermath command in {p.name}: {bad}')

for p in BP.rglob('*'):
    if p.is_file() and p.suffix.lower() in {'.jar', '.java', '.kt', '.gradle'}:
        problems.append(f'forbidden java/mod artifact: {p}')

print(json.dumps({'largest_generated_command_count': largest_commands, 'problems': problems}, indent=2))
sys.exit(1 if problems else 0)
