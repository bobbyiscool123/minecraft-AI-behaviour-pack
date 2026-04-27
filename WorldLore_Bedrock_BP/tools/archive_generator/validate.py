#!/usr/bin/env python3
import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
DATA = ROOT / 'data'
OUT = ROOT / 'functions' / 'wl' / 'generated'

def load(name):
    return json.loads((DATA / name).read_text())

problems = []
counts = {
    'place_classes': len(load('place_classes.json')),
    'arc_pools': len(load('arc_pools.json')),
    'arcs': len(load('arcs.json')),
    'scenelets': len(load('scenelets.json')),
    'messages': len(load('messages.json')),
    'aftermath': len(load('aftermath.json')),
}

if counts['place_classes'] < 5: problems.append('need at least 5 place classes')
if counts['arc_pools'] < 5: problems.append('need at least 5 arc pools')
if counts['arcs'] < 10: problems.append('need at least 10 arcs')
if counts['scenelets'] < 20: problems.append('need at least 20 scenelets')
if counts['messages'] < 80: problems.append('need at least 80 messages')
if counts['aftermath'] < 15: problems.append('need at least 15 aftermath presets')

largest = 0
for p in OUT.glob('*.mcfunction'):
    if p.name != p.name.lower():
        problems.append(f'non-lowercase generated path: {p.name}')
    cmds = [line for line in p.read_text().splitlines() if line and not line.startswith('#')]
    largest = max(largest, len(cmds))
    if len(cmds) > 30:
        problems.append(f'generated file over budget: {p.name}')

print(json.dumps({'counts': counts, 'generated_function_count': len(list(OUT.glob("*.mcfunction"))), 'largest_function_command_count': largest, 'problems': problems}, indent=2))
if problems:
    sys.exit(1)
