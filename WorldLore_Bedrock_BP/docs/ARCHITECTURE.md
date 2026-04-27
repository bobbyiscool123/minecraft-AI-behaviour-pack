# Architecture (PR1)

## Runtime shape
1. `functions/tick.json` calls only `wl/tick`.
2. `wl/tick` ensures setup then calls `wl/runtime/tick`.
3. `wl/runtime/tick` increments a clock and runs one low-frequency phase when matched.

## Phases
- 100: scan near players and maintain anchors
- 200: update local pressure + mood
- 300: select arc/event candidates
- 400: advance arc and emit scenelet/message/aftermath actions
- 500: cooldown and queue cleanup

## Place model
- Hard DNA: base, context, myth, arc pool (rolled once)
- Soft DNA: threat, mood, tension, cooldown
- Memory DNA: grateful/mourning history outcomes

## Safety
- Tiny per-tick root logic
- No global full-world scans
- Safe aftermath edits only (small setblock usage)
- Failsafe command path clears invalid pending state
