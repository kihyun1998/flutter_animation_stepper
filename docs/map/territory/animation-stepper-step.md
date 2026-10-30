# AnimationStepper step

## What it is
Draws one step of `AnimationStepper`: its state (completed, active, inactive) from `currentStep`, the colour and title style for that state, the circle with the step's icon, the optional title and subtitle, the loading ring on the active step, and whether a tap reaches `onStepTapped`.

## Governing decisions
**None.** No decision record exists in the repo.

## Design model
From reading the source only:
- State: `index < currentStep` is completed, `== currentStep` is active, otherwise inactive. `currentStep` is asserted `>= 0` only; a value at or past `steps.length` marks every step completed.
- A title style from the theme replaces the default entirely; the defaults are 12 pt in the state colour.
- The icon is wrapped in white `IconTheme` and `DefaultTextStyle` and scaled by `FittedBox` to `stepSize - stepIconPadding * 2`, so any widget can be an icon.
- The loading ring is always in the tree and faded with `AnimatedOpacity`; it shows only when `isLoading` and the step is active.
- A tap reaches `onStepTapped` only when `enableStepTapping` is true and the step is not the loading step.
- The step box is fixed size so the ring does not move the layout: see the invariant below.
- `StepItem.data` is never read by the package; it is the consumer's payload.

## Code
- `lib/src/widgets/animation_stepper.dart — _AnimationStepperState._buildStep`
- `lib/src/models/step_item.dart — StepItem`

## Reference behaviour
**None.**

## Cross-cutting invariants
- [Step box width](../invariant/step-box-width.md)

## Blast radius
- [Connected layout](connected-layout.md): its lines are spaced for a step column exactly one box wide; anything that widens the column moves the step's centre off its line.
- [Separated layout](separated-layout.md): its step slot has the box's width; a wider step is clipped or wrapped to it.
- [Public API](public-api.md): the theme fields this reads (`completedTitleStyle`, `stepIconPadding` and the rest) are public; renaming one is a breaking change.

## Known holes / open
- The class doc says `steps` "must not be empty", and no assert enforces it; from reading, an empty list makes `_buildConnectedLayout` call `List.generate(-1, …)`. Not run.
- A title wider than the box widens the step's `Column` in connected mode (nothing constrains its width there). See [Connected layout](connected-layout.md).
