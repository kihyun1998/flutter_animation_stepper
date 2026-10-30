# Example app

## What it is
A Flutter app under `example/` that shows both steppers in two tabs, with each example's step state held in Riverpod providers. It consumes the package through `path: ../` and is never published (`publish_to: "none"`).

## Governing decisions
**None.**

## Design model
From reading the source:
- `main.dart` builds a `TabBarView` of `ExampleCard`s (from `allExamples`) and `MovingDotExampleCard`s (from `allMovingDotExamples`); each card keeps its state in a provider keyed by `exampleId`.
- The providers use `riverpod_generator`; the `*.g.dart` files are generated and committed, and `analysis_options.yaml` excludes them from analysis.

## Code
- `example/lib/main.dart — MyApp, ExamplePage`
- `example/lib/data/example_data.dart — ExampleData, MovingDotExampleData`
- `example/lib/widgets/example_card.dart — ExampleCard`
- `example/lib/widgets/moving_dot_example_card.dart — MovingDotExampleCard`
- `example/lib/provider/stepper_controller.dart`, `example/lib/provider/moving_dot_stepper_controller.dart` (and their `.g.dart`)
- `example/lib/model/stepper_state.dart`, `example/lib/model/moving_dot_stepper_state.dart`

## Reference behaviour
**None.**

## Cross-cutting invariants
**None.**

## Blast radius
- [Release](release.md): the README's Riverpod section reproduces this app's model and controller; changing the app leaves that section describing the old one.
- [Dependency upkeep](dependency-upkeep.md): its Riverpod majors are held back on purpose.

## Known holes / open
- It is the only place the widgets are exercised; there are no package tests.
