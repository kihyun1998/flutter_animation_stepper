## 2.0.1

### New Features
- **MovingDotStepper**: Added `completedDot`, `activeDot`, and `inactiveDot` parameters to completely replace dot widgets with custom widgets
- Added 4 new examples demonstrating custom dot widgets (square, diamond, gradient, text-based)

### Notes
- Use `completedDot`, `activeDot`, `inactiveDot` for fully custom dot widgets (replaces entire dot structure)
- Use `completedIcon`, `activeIcon`, `inactiveIcon` for custom icons inside default circular dots

## 2.0.0

### Breaking Changes
- **MovingDotStepper**: Removed `stepSpacing` and `linePadding` theme properties
- **MovingDotStepper**: Steps now automatically distribute evenly across available width
- **MovingDotStepper**: Width is now controlled by parent widget (Container, Expanded, etc.)

### New Features
- **MovingDotStepper**: Added `lineInset` theme property to control spacing between dots and lines
- **MovingDotStepper**: Steps now scale responsively based on container width

### Migration Guide
- Remove `stepSpacing` and `linePadding` from `MovingDotStepperTheme`
- Wrap `MovingDotStepper` in a sized container or use `Expanded` to control width
- Use `lineInset` property (default: 0.0) for spacing between dots and lines

## 1.0.2

- Added `activeIcon` and `inactiveIcon` parameters to MovingDotStepper
- Now supports custom icons for all three states: inactive, active, and completed
- Added four new examples demonstrating custom icons in all states

## 1.0.1

- Added MovingDotStepper widget with independent line segments and extensive customization options (background fill, border width, shadow, outlined active state)

## 1.0.0

### Initial Release
- Horizontal animation stepper widget with smooth transitions
- Fully customizable theme support
- Step tap navigation with callback
- Loading indicator on specific steps
