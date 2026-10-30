# Step box width

## The fact
In `AnimationStepper`, every step occupies a square box of side `theme.stepSize + theme.loadingIndicatorStrokeWidth * 2`, and every line is placed by assuming that box: horizontally at `box / 2` from the edge, vertically at `box / 2 - theme.lineThickness / 2`. Each site writes the expression out itself; there is no shared getter.

## Why it is cross-cutting
The box exists so the loading ring (`CircularProgressIndicator`, stroke outside the circle) never changes the step's size. The step draws the box, and each layout positions lines against it independently. The sites do not call each other or one helper, so a change to the box in one place (for example, a new ring padding) leaves the others aligned to the old box, and the lines miss the circle centres. (reading of `animation_stepper.dart` at the synced-at commit)

## Territories it holds in
- [AnimationStepper step](../territory/animation-stepper-step.md): `_buildStep` sizes the outer `SizedBox` and the ring's `SizedBox` to the box.
- [Connected layout](../territory/connected-layout.md): `_buildConnectedLayout` sets the `Positioned` `top`, `left` and `right` from the box. Its `totalWidth` uses `stepSize`, not the box; with narrow titles the centres still line up (centre spacing and segment length both come out as `stepSpacing - 2 * strokeWidth / (n - 1)`), so that difference is arithmetic, not a bug.
- [Separated layout](../territory/separated-layout.md): `_buildLinesForSeparatedLayout` spacers and `_buildStepsForSeparatedLayout`'s `stepWidth`.
- [Line fill animation](../territory/line-fill-animation.md): `AnimationStepper._buildConnectingLine` adds the vertical `top` padding in separated mode.

## What a violation looks like
Lines start or end inside or short of the step circles, or sit above or below their centres. It reproduces whenever `loadingIndicatorStrokeWidth` or `stepSize` is changed and one site still computes the box differently.

## Discovery history
- Found by reading `animation_stepper.dart` during the map's first build (2026-10-30). Not run: the container had no Flutter SDK.

## Where it will recur
Any new widget or layout in `AnimationStepper` that places something relative to a step (a badge, a new line style, a vertical mode) is subject to this: grep `loadingIndicatorStrokeWidth \* 2` and match every hit.
