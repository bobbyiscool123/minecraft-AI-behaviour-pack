# Architecture

Pipeline: data registry -> generator -> generated functions -> runtime clock phases. Runtime is tiny: scan, pressure, select, advance, cleanup.

PR1 intentionally ships a vertical slice only.
