# Release

## What it is
Publishing the package to pub.dev: the version and metadata in `pubspec.yaml`, the `CHANGELOG.md` entry, the README that pub.dev shows, and the `LICENSE`.

## Governing decisions
- [`docs/agents/thegraph.md`](../../agents/thegraph.md) names `pub-ready` as the release bar.

## Design model
From reading the repo:
- The version lives in `pubspec.yaml` and is repeated by hand in the README install snippet and the Riverpod example (`flutter_animation_stepper: ^<version>`); a release updates both.
- `CHANGELOG.md` has one section per version, newest first; a breaking release carries "Breaking Changes" and "Migration Guide" sections (2.0.0).
- `pubspec.lock` is not committed at the root (`.gitignore`, `/pubspec.lock`).
- There is no CI: no `.github/` directory.

## Code
- `pubspec.yaml`
- `CHANGELOG.md`
- `README.md`
- `LICENSE`

## Reference behaviour
**None.**

## Cross-cutting invariants
**None.**

## Blast radius
- [Public API](public-api.md): the README documents the API by example; an API change leaves the README wrong until it is updated.
- [Dependency upkeep](dependency-upkeep.md): raising a root dependency floor narrows consumers' resolution and so is a release decision (issue #1).
- [Example app](example-app.md): it is what the README's examples are drawn from.

## Known holes / open
- The README's "With Custom Theme" example passes `completeColor`, `loadingColor`, `iconSize` and `lineHeight` to `AnimationStepperTheme`, and "With Loading Indicator" passes `loadingStep` to `AnimationStepper`; none of these exist in the code at the synced-at commit (the real names are `completedColor`, `lineThickness`, `isLoading`).
