# Dependency upkeep

## What it is
Keeping the package's and the example's dependency constraints current. Designed in issue #1 (Dependabot) and not built.

## Governing decisions
**None.** Issue #1 holds the design: root pub monthly with `increase-if-necessary`, one PR per dependency; `/example` pub monthly and grouped, ignoring Riverpod majors; no `github-actions` entry since there is no workflow. Tracked: #1.

## Design model
- Root constraints are a floor for consumers, so a raise is a release decision, not a chore (issue #1).
- The example pins Riverpod 2.x and its generators (`example/pubspec.yaml`: `flutter_riverpod`, `riverpod_annotation`, `riverpod_generator`, `riverpod_lint` at `^2.6.x`).

## Code
**None.** A first slice is `.github/dependabot.yml`, as issue #1 specifies.

## Reference behaviour
**None.** Issue #1 cites `flutter_table_plus` and five sibling packages that received the same configuration on 2026-10-23 as prior art.

## Cross-cutting invariants
**None.**

## Blast radius
- [Release](release.md): a root constraint raise is published to consumers.
- [Example app](example-app.md): grouped example updates must keep it building through `path: ../`.

## Known holes / open
- Issue #1 says "at `0.x`, every minor release" falls outside the caret; the root's only non-SDK dependency is `flutter_lints: ^5.0.0` (dev), so that sentence does not describe this repo.
