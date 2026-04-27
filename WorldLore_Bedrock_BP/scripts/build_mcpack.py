#!/usr/bin/env python3
import pathlib
import zipfile

BP = pathlib.Path(__file__).resolve().parents[1]
OUT = BP / 'dist'
OUT.mkdir(exist_ok=True)
out = OUT / 'WorldLore_Bedrock_Archive_Engine_v0_1_0.mcpack'
zip_path = out.with_suffix('.zip')

with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zf:
    for p in BP.rglob('*'):
        if p.is_file() and 'dist/' not in p.as_posix() and p.name != '.DS_Store':
            zf.write(p, p.relative_to(BP))

zip_path.replace(out)
print(out)
