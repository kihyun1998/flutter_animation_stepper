# Line fill animation

## What it is
How both steppers animate a step change: one `AnimationController` per widget, restarted on every `currentStep` change, and the line between two steps filling forward or emptying backward. `MovingDotStepper`'s dot crossfade runs on the same controller ([MovingDot dots](moving-dot-dots.md)).

## Governing decisions
**None.**

## Design model
- The line logic exists twice, once per widget, with no shared code: `_buildConnectingLine` computes `progress` the same way in both, and `didUpdateWidget` keeps `_previousStep` and restarts the controller the same way. The two must behave the same (maintainer, 2026-10-30): a change to one is made to the other.
- Direction: moving forward, the line before the new step fills (`progress = animation.value`); moving backward, the line after the new step empties (`1 - animation.value`); every other line is full if before `currentStep`, else empty. Only the line next to the new step animates, so a jump of several steps snaps the lines in between.
- `didUpdateWidget` calls `reset()` then `forward()`, so a step change during a running animation restarts from zero.
- A changed `animationDuration` is applied; a changed `animationCurve` is not, because the `CurvedAnimation` is built once in `initState` (both widgets).
- Differences between the two copies today (from reading): `AnimationStepper.initState` calls `forward()` and `MovingDotStepper.initState` sets `value = 1.0`, which look the same on first build since `_previousStep == currentStep`; and the default durations differ (`AnimationStepperTheme` 300 ms, `MovingDotStepperTheme` 400 ms). `AnimationStepper` also adds the separated-mode vertical padding inside `_buildConnectingLine`.

## Code
- `lib/src/widgets/animation_stepper.dart — _AnimationStepperState.initState, didUpdateWidget, _buildConnectingLine`
- `lib/src/widgets/moving_dot_stepper.dart — _MovingDotStepperState.initState, didUpdateWidget, _buildConnectingLine`

## Reference behaviour
**None.**

## Cross-cutting invariants
- [Step box width](../invariant/step-box-width.md) (the separated-mode padding in `AnimationStepper._buildConnectingLine`)

## Blast radius
- [MovingDot dots](moving-dot-dots.md): the crossfade reads the same `_previousStep` and `_animation`; changing when or how the controller restarts changes the dots too.
- [Separated layout](separated-layout.md): it relies on this function to put lines at the circle centre height.
- [Connected layout](connected-layout.md): it relies on this function returning an unpadded line.

## Known holes / open
- A changed `animationCurve` is ignored after the first build, in both widgets.
- Whether a multi-step jump should fill every line in between is not decided; today it does not.
