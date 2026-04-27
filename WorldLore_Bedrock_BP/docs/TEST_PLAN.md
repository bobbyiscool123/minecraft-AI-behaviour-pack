# Test Plan (PR1)

1. Import pack and enter a village world.
2. Run `/function wl/setup` once.
3. Run `/function wl/debug/on`.
4. Wait for phase 100/200/300/400 cycles and run `/function wl/debug/status`.
5. Force scenarios:
   - `/function wl/test/force_village_bee_witch`
   - `/function wl/test/force_village_pillager`
   - `/function wl/test/force_village_portal`
   - `/function wl/test/force_grateful`
   - `/function wl/test/force_mourning`
6. Confirm scenelets/messages appear and aftermath remains tiny/safe.
