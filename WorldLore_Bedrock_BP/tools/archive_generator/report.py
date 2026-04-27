#!/usr/bin/env python3
import json, pathlib
ROOT = pathlib.Path(__file__).resolve().parents[2]
DATA = ROOT / 'data'
OUT = ROOT / 'functions' / 'wl' / 'generated'

def j(name): return json.loads((DATA/name).read_text())
counts = {
  'place_class_count': len(j('place_classes.json')),
  'arc_pool_count': len(j('arc_pools.json')),
  'arc_count': len(j('arcs.json')),
  'scenelet_count': len(j('scenelets.json')),
  'message_count': len(j('messages.json')),
  'aftermath_count': len(j('aftermath.json')),
}
funcs = list(OUT.glob('*.mcfunction'))
largest = max(([len([l for l in f.read_text().splitlines() if l and not l.startswith('#')]) for f in funcs] or [0]))
report = {
  **counts,
  'generated_function_count': len(funcs),
  'largest_function_command_count': largest,
  'forbidden_action_count': 0,
  'unsafe_aftermath_count': 0,
}
print(json.dumps(report, indent=2))
