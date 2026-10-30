# Separated layout

## What it is
The default `AnimationStepper` layout (`theme.connectedLine` is false): two `Row`s stacked in a `Stack`, one of spacers and lines, one of steps and spacers, sized so each line falls in the gap between two step boxes.

## Governing decisions
**None.**

## Design model
From reading the source only:
- Both rows alternate the same widths: a box (`stepSize + loadingIndicatorStrokeWidth * 2`) then `stepSpacing`, ending on a box. The visible gap between circle and line is the ring's stroke plus `lineHorizontalPadding` (default `0.0`).
- Each step is put in a `SizedBox` of the box's width, so a long title wraps instead of widening the step.
- The vertical position of the lines comes from `_buildConnectingLine`'s separated-mode padding.

## Code
- `lib/src/widgets/animation_stepper.dart — _AnimationStepperState._buildSeparatedLayout`
- `lib/src/widgets/animation_stepper.dart — _AnimationStepperState._buildLinesForSeparatedLayout`
- `lib/src/widgets/animation_stepper.dart — _AnimationStepperState._buildStepsForSeparatedLayout`

## Reference behaviour
**None.**

## Cross-cutting invariants
- [Step box width](../invariant/step-box-width.md)

## Blast radius
- [AnimationStepper step](animation-stepper-step.md): the step slot here is the box's width; a step that needs more room is squeezed into it.
- [Line fill animation](line-fill-animation.md): the vertical offset of every line in this layout is set inside `_buildConnectingLine`, not here; moving the line without changing that padding misplaces it.

## Known holes / open
- An open bug, recorded only in `todo.md`: in `_buildSeparatedLayout`, built on a `Stack`, the lines do not find their positions. The condition and symptom are not known (maintainer, 2026-10-30: does not remember), and reading the code did not show where the two rows diverge.
