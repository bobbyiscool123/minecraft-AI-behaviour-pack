# Packaging

1. Generate tiny archive: `python tools/archive_generator/generate.py --mode tiny`
2. Validate generated output: `python tools/archive_generator/validate.py`
3. Validate pack: `python scripts/validate_pack.py`
4. Build: `python scripts/build_mcpack.py`
5. Import resulting `.mcpack` from `dist/` into Bedrock.

Important: zip content root must contain `manifest.json` directly (no nested parent folder).
