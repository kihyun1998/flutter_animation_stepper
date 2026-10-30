# Map

The territory map of `flutter_animation_stepper`. A comment's why, trap and measured value go to a note here.
Notes are added as they come up, or all at once with `grill-map`, which also
reads hand-written notes as leads and keeps their paths.

## What it answers

- **If I touch this, what else moves?** Open the territory that holds the code, then follow its `## Blast radius` and `## Cross-cutting invariants`.
- **What decision is this shape derived from?** Read the territory's `## Governing decisions`. Almost every one says **None.**: the repo has no decision records, and the design is known only from the source and from the maintainer.

`## Blast radius` is a checklist: an edge with nothing to do is a correct outcome. A **None.** under a heading is itself the answer.

## The repo in one paragraph

A pub.dev package with two independent horizontal stepper widgets. `AnimationStepper` takes `StepItem`s, has two layouts (connected and separated) and a loading ring; `MovingDotStepper` takes a step count, fills its parent's width and crossfades its dots. Both animate the line between steps with the same logic, written twice. An `example/` app shows both through Riverpod. The largest gap: there are no tests (`test/flutter_animation_stepper_test.dart` is empty) and no CI, so the example app is the only place the widgets run.

## Territories

- [AnimationStepper step](territory/animation-stepper-step.md)
- [Connected layout](territory/connected-layout.md)
- [Separated layout](territory/separated-layout.md)
- [Line fill animation](territory/line-fill-animation.md)
- [MovingDot width distribution](territory/moving-dot-width-distribution.md)
- [MovingDot dots](territory/moving-dot-dots.md)
- [Public API](territory/public-api.md)
- [Release](territory/release.md)
- [Dependency upkeep](territory/dependency-upkeep.md)
- [Example app](territory/example-app.md)

## Cross-cutting invariants

- [Step box width](invariant/step-box-width.md)

## Conventions

- Section headings are the same in every note; an empty section says **None.**
- Code is cited by symbol (`file — Type.method`), never by line number.
- Links are plain relative markdown links.
- A fact another file owns is linked, not restated; an issue is cited as evidence (`Tracked: #1`), not as a status.
- Every claim carries its evidence (a symbol, a file, a commit) or its source and date, such as `(maintainer, 2026-10-30)`.

## What it cannot answer

Source files and issues are text inside notes, not nodes: the map does not list every caller of a symbol, and an issue's current state is on GitHub.

## Scope

Everything under `lib/`, `example/`, the release files and the open backlog. `todo.md` holds one bug, recorded in [Separated layout](territory/separated-layout.md). The platform folders under `example/` (`android/`, `ios/` and the rest) are Flutter's generated runners and have no note. A territory appears when something in the repo commits to it, such as code, an open issue with a design, or a record; an idea with nothing behind it has no note.

<!-- grill-map build stamp: d525035 -->
<!-- grill-map synced at: 9b5c492 (2026-10-30) -->
