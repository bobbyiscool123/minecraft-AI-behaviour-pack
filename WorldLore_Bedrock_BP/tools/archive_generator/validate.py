#!/usr/bin/env python3
import json, pathlib, re, sys
ROOT = pathlib.Path(__file__).resolve().parents[2]
DATA = ROOT / 'data'
OUT = ROOT / 'functions' / 'wl' / 'generated'

def j(name): return json.loads((DATA/name).read_text())

problems = []
counts = {
  'place_classes': len(j('place_classes.json')),
  'arc_pools': len(j('arc_pools.json')),
  'arcs': len(j('arcs.json')),
  'scenelets': len(j('scenelets.json')),
  'messages': len(j('messages.json')),
  'aftermath': len(j('aftermath.json')),
}

for p in OUT.glob('*.mcfunction'):
    if p.name.lower() != p.name:
        problems.append(f'non-lowercase generated path: {p.name}')
    cmds = [l for l in p.read_text().splitlines() if l and not l.startswith('#')]
    if len(cmds) > 30:
        problems.append(f'function over budget (>30 commands): {p.name}')
    forbidden = re.search(r'(api_key|openai|https://|summon wither|lava)', p.read_text(), re.I)
    if forbidden:
        problems.append(f'forbidden token in generated file: {p.name}')

print(json.dumps({'counts':counts,'generated_function_count':len(list(OUT.glob('*.mcfunction'))),'problems':problems}, indent=2))
if problems:
    sys.exit(1)
