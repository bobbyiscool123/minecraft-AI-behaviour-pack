# Test Plan

## Setup
1. Import pack and enable in world behavior packs.
2. Run `/function wl/setup`.
3. Run `/function wl/debug/on`.

## Core runtime checks
- Wait ~500 ticks and run `/function wl/debug/status`.
- Confirm clock advances and event state updates.

## Forced scenarios
- Bee/witch: `/function wl/test/force_village_bee_witch`
- Pillager: `/function wl/test/force_village_pillager`
- Portal: `/function wl/test/force_village_portal`
- Mourning: `/function wl/test/force_mourning`
- Grateful: `/function wl/test/force_grateful`

## Safety checks
- No large fill/lava/fire grief actions.
- Scenelets remain tiny and local.
- Aftermath edits are tiny and reversible-looking.
