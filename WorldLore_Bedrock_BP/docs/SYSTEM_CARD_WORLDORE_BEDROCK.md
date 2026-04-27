# System Card — WorldLore Bedrock Archive Engine

WorldLore is a **behavior-pack-only** lore illusion engine for Minecraft Bedrock Edition.
It does not run a backend model. It precompiles content and runs a tiny runtime loop.

## What this PR1 implements
- Valid importable behavior pack root and manifest.
- Setup + scoreboard state backbone.
- Low-frequency scheduler (100/200/300/400/500 phases).
- Village-like anchor identity with duplicate prevention and recovery fallback.
- Stable Place DNA scaffold (hard/soft/memory traits).
- Arc + queue + scenelet + message + aftermath vertical slice.
- Generator + validator + report scripts with tiny deterministic output.

## What this PR1 does not implement
- Full 1000+ place-class archive.
- Deep production content variety.
- Any backend/LLM or custom resource assets.
