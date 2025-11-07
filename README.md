# Flutter Animation Stepper

A Flutter package for creating beautiful horizontal steppers with smooth animations and customizable themes.

## Features

- **Smooth Animations**: Elegant transitions between step states with customizable animation curves
- **Fully Customizable**: Control colors, sizes, fonts, and animation durations through theme
- **Loading Indicator**: Built-in support for showing loading state on specific steps
- **Step Navigation**: Tap on steps to navigate with `onStepTapped` callback
- **Flexible Widgets**: Support for any widget type in steps (Icon, Image, SVG, etc.)
- **Layout Options**: Choose between connected or separated line layouts
- **Horizontal Scrolling**: Automatically handles overflow with horizontal scrolling

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_animation_stepper: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Example

```dart
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';

AnimationStepper(
  steps: [
    StepItem(
      icon: Icon(Icons.shopping_cart),
      title: 'Cart',
      subtitle: 'Review items',
    ),
    StepItem(
      icon: Icon(Icons.payment),
      title: 'Payment',
      subtitle: 'Enter details',
    ),
    StepItem(
      icon: Icon(Icons.check_circle),
      title: 'Confirm',
      subtitle: 'Complete order',
    ),
  ],
  currentStep: 1,
  onStepTapped: (index) {
    setState(() => currentStep = index);
  },
)
```

### With Custom Theme

```dart
AnimationStepper(
  steps: steps,
  currentStep: currentStep,
  theme: AnimationStepperTheme(
    activeColor: Colors.blue,
    completeColor: Colors.green,
    inactiveColor: Colors.grey,
    loadingColor: Colors.orange,
    iconSize: 32,
    lineHeight: 4,
  ),
  onStepTapped: (index) {
    setState(() => currentStep = index);
  },
)
```

### With Loading Indicator

```dart
AnimationStepper(
  steps: steps,
  currentStep: currentStep,
  loadingStep: 1, // Show loading on step 1
  onStepTapped: (index) {
    setState(() => currentStep = index);
  },
)
```

## Additional Information

For more examples, check out the `/example` folder in the repository.

### Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Issues

If you encounter any issues, please report them on [GitHub Issues](https://github.com/your-username/flutter_animation_stepper/issues).

## License

This project is licensed under the MIT License.
