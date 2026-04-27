#!/usr/bin/env python3
import pathlib, zipfile
ROOT = pathlib.Path(__file__).resolve().parents[1]
BP = ROOT / 'WorldLore_Bedrock_BP'
OUT = ROOT / 'dist'
OUT.mkdir(exist_ok=True)
out = OUT / 'WorldLore_Bedrock_Archive_Engine_v0_1_0.mcpack'
with zipfile.ZipFile(out.with_suffix('.zip'), 'w', zipfile.ZIP_DEFLATED) as z:
    for p in BP.rglob('*'):
        if p.is_file():
            z.write(p, p.relative_to(BP))
out.with_suffix('.zip').replace(out)
print(out)
