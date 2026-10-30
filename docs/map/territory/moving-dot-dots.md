# MovingDot dots

## What it is
Draws each `MovingDotStepper` step: a dot for its state (completed, active, inactive), a custom widget that replaces the dot or an icon inside the default dot, the label under it, the crossfade between states on a step change, and tap handling.

## Governing decisions
**None.**

## Design model
From reading the source:
- Precedence per state: `completedDot` / `activeDot` / `inactiveDot` replaces the whole dot; else the default circle with `completedIcon` (default `Icons.check`) / `activeIcon` / `inactiveIcon` inside; with no icon, active is a filled circle and inactive a bordered one (`CHANGELOG.md` 2.0.1 and 1.0.2 describe the same).
- A custom dot is not sized by the package; its slot is `dotSize` square.
- Active dot: `activeFillColor ?? activeColor`, with a border only when `activeBorderColor` is set.
- Crossfade: on forward, the old active dot fades to completed and the new step fades from inactive to active; on backward, the reverse. Both use `Opacity` over the shared `_animation`.
- A tap reaches `onStepTapped` when `enableStepTapping` is true; there is no loading state in this widget.

## Code
- `lib/src/widgets/moving_dot_stepper.dart — _MovingDotStepperState._buildStep, _buildDot, _buildCompletedDot, _buildActiveDot, _buildInactiveDot, _getLabelStyle`

## Reference behaviour
**None.**

## Cross-cutting invariants
**None.**

## Blast radius
- [Line fill animation](line-fill-animation.md): the dots and the lines share `_previousStep` and the controller; a dot change that alters the transition timing must match the line.
- [MovingDot width distribution](moving-dot-width-distribution.md): the line width assumes each dot slot is `dotSize`; a dot drawn larger overlaps the lines.
- [Public API](public-api.md): the six dot and icon parameters are public; their precedence is documented in the class docs and README.

## Known holes / open
- On a jump of several steps, only `_previousStep` and the new `currentStep` crossfade; the steps between snap to completed or inactive.
