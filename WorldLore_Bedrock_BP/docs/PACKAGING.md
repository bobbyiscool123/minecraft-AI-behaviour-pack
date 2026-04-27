# Packaging

1. `python WorldLore_Bedrock_BP/tools/archive_generator/generate.py --mode tiny`
2. `python WorldLore_Bedrock_BP/tools/archive_generator/validate.py`
3. `python WorldLore_Bedrock_BP/scripts/validate_pack.py`
4. `python WorldLore_Bedrock_BP/scripts/build_mcpack.py`
5. Import the generated `.mcpack` from `WorldLore_Bedrock_BP/dist/`.

> Important: the archive must contain `manifest.json` at root (no extra nesting folder).
