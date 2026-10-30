# Connected layout

## What it is
The `AnimationStepper` layout used when `theme.connectedLine` is true: lines run from circle centre to circle centre, behind the circles, in one fixed-width `Stack`.

## Governing decisions
**None.**

## Design model
From reading the source only:
- Width is fixed: `(steps.length - 1) * stepSpacing + stepSize`. The steps sit in a `Row` with `spaceBetween`; the lines sit in a `Positioned` row inset by half a box on each side, one `Expanded` segment per gap.
- The whole stepper is inside a horizontal `SingleChildScrollView`, so overflow scrolls rather than clips.
- Alignment holds only while every step column is exactly one box wide.

## Code
- `lib/src/widgets/animation_stepper.dart — _AnimationStepperState._buildConnectedLayout`
- `lib/src/widgets/animation_stepper.dart — _AnimationStepperState.build` (chooses the layout)

## Reference behaviour
**None.**

## Cross-cutting invariants
- [Step box width](../invariant/step-box-width.md)

## Blast radius
- [AnimationStepper step](animation-stepper-step.md): the line positions assume the step column is one box wide; a change to the step's size or content width breaks them.
- [Line fill animation](line-fill-animation.md): the segment it fills is the `Expanded` this layout gives it; `_buildConnectingLine` returns a bare line only because this layout already positioned it (`connectedLine` branch).

## Known holes / open
- From reading, a title or subtitle wider than the box widens that step's `Column` (the `Row` gives it unbounded width), so `spaceBetween` moves the circle centres while the line segments stay evenly spaced. Not run.
- An empty `steps` list reaches `List.generate(-1, …)` here.
