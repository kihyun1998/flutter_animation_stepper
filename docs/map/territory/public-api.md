# Public API

## What it is
What a consumer can import: the barrel `lib/flutter_animation_stepper.dart` exporting the two widgets, `StepItem`, and the two theme classes with their defaults and `copyWith`.

## Governing decisions
**None.** Breaking changes are announced in `CHANGELOG.md` (2.0.0 has a migration guide); no record says what counts as breaking.

## Design model
From reading the source:
- `AnimationStepper` takes a `List<StepItem>`; `MovingDotStepper` takes `stepCount` and optional `stepLabels`. The two widgets share no type besides Flutter's.
- Each theme is an immutable `const` class; every field has a default, and `copyWith` lists every field (19 in `AnimationStepperTheme`, 21 in `MovingDotStepperTheme`, counted at the synced-at commit). A field added to a theme without a `copyWith` parameter cannot be overridden through it.
- The default colours are the same in both themes (`0xFF2196F3`, `0xFFBDBDBD`, `0xFF4CAF50`, `0xFFE0E0E0`); the values agree, nothing ties them.

## Code
- `lib/flutter_animation_stepper.dart`
- `lib/src/models/animation_stepper_theme.dart — AnimationStepperTheme, AnimationStepperTheme.copyWith`
- `lib/src/models/moving_dot_stepper_theme.dart — MovingDotStepperTheme, MovingDotStepperTheme.copyWith`
- `lib/src/models/step_item.dart — StepItem`
- `lib/src/widgets/animation_stepper.dart — AnimationStepper`
- `lib/src/widgets/moving_dot_stepper.dart — MovingDotStepper`

## Reference behaviour
**None.**

## Cross-cutting invariants
**None.**

## Blast radius
- [Release](release.md): a renamed or removed public field is a major version and a CHANGELOG migration note.
- [Example app](example-app.md): it uses the public API through `path: ../`, so a breaking change shows up there first.
- [AnimationStepper step](animation-stepper-step.md), [MovingDot dots](moving-dot-dots.md), [MovingDot width distribution](moving-dot-width-distribution.md): each reads theme fields; a changed default changes their output.

## Known holes / open
- `test/flutter_animation_stepper_test.dart` holds only `void main() {}`: no test covers any of the API.
