# MovingDot width distribution

## What it is
How `MovingDotStepper` spreads its steps across the width its parent gives it (since 2.0.0): fixed-width dots, optional `lineInset` gaps, and lines that take the rest equally.

## Governing decisions
**None.** The 2.0.0 entry in `CHANGELOG.md` records the change (steps distribute across the parent's width; `stepSpacing` and `linePadding` removed) without a reason.

## Design model
From reading the source:
- `lineWidth = (maxWidth - dotSize * stepCount - lineInset * 2 * (stepCount - 1)) / (stepCount - 1)`, clamped at `0`.
- The width comes from the parent through `LayoutBuilder`. The README tells users to give it a bounded width (`Container`, `Expanded`); nothing in the code checks it.
- Input bounds: `stepCount > 0` and `stepLabels.length == stepCount` are asserted; nothing bounds `stepCount` against the width.

## Code
- `lib/src/widgets/moving_dot_stepper.dart — _MovingDotStepperState.build, _buildStepper`

## Reference behaviour
**None.**

## Cross-cutting invariants
**None.**

## Blast radius
- [MovingDot dots](moving-dot-dots.md): each step slot is exactly `dotSize` wide; a custom dot or a label wider than that is not accounted for in the line width.
- [Public API](public-api.md): `lineInset` and `dotSize` are public theme fields, and this formula is what they mean.

## Known holes / open
- From reading: an unbounded parent width (inside a horizontal scroll or a bare `Row`) makes `lineWidth` infinite and the `SizedBox` width infinite. Not run.
- From reading: when the width is too small for the dots, `lineWidth` clamps to `0` and the `Row` overflows.
- A label wider than `dotSize` is constrained to the dot's width by the step's `SizedBox` and wraps.
