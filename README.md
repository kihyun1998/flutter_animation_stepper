# Flutter Animation Stepper

A Flutter package for creating beautiful horizontal steppers with smooth animations and customizable themes.

## Features

- **Two Stepper Widgets**:
  - `AnimationStepper`: Traditional stepper with icons, titles, and subtitles
  - `MovingDotStepper`: Minimal dot-based stepper with smooth transitions
- **Smooth Animations**: Elegant transitions between step states with customizable animation curves
- **Fully Customizable**: Control colors, sizes, fonts, and animation durations through theme
- **Custom Icons**: Support for custom icons in all states (inactive, active, completed) including SVG
- **Loading Indicator**: Built-in support for showing loading state on specific steps
- **Step Navigation**: Tap on steps to navigate with `onStepTapped` callback
- **Flexible Widgets**: Support for any widget type in steps (Icon, Image, SVG, etc.)
- **Layout Options**: Choose between connected or separated line layouts
- **Horizontal Scrolling**: Automatically handles overflow with horizontal scrolling

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_animation_stepper: ^2.0.1
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

### MovingDotStepper - Basic Usage

```dart
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';

// Steps are evenly distributed across the available width
// Control width using a parent Container or Expanded widget
Container(
  width: 400, // Or use Expanded for flexible width
  child: MovingDotStepper(
    stepCount: 4,
    currentStep: 1,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
    onStepTapped: (index) {
      setState(() => currentStep = index);
    },
  ),
)
```

### MovingDotStepper - With Custom Icons

```dart
Container(
  width: double.infinity, // Fill available width
  child: MovingDotStepper(
    stepCount: 4,
    currentStep: 1,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
    inactiveIcon: Icon(Icons.radio_button_unchecked, color: Colors.grey, size: 16),
    activeIcon: Icon(Icons.play_circle_filled, color: Colors.white, size: 16),
    completedIcon: Icon(Icons.check_circle, color: Colors.white, size: 16),
    theme: MovingDotStepperTheme(
      activeColor: Colors.blue,
      completedColor: Colors.green,
      dotSize: 28.0,
      lineInset: 4.0, // Optional: spacing between dots and lines
    ),
    onStepTapped: (index) {
      setState(() => currentStep = index);
    },
  ),
)
```

### MovingDotStepper - With SVG Icons

```dart
import 'package:flutter_svg/flutter_svg.dart';

Expanded(
  child: MovingDotStepper(
    stepCount: 3,
    currentStep: 0,
    inactiveIcon: SvgPicture.asset('assets/icons/inactive.svg', width: 16, height: 16),
    activeIcon: SvgPicture.asset('assets/icons/active.svg', width: 16, height: 16),
    completedIcon: SvgPicture.asset('assets/icons/completed.svg', width: 16, height: 16),
    onStepTapped: (index) {
      setState(() => currentStep = index);
    },
  ),
)
```

### MovingDotStepper - With Custom Dot Widgets

Replace the entire dot structure (not just the icon) with custom widgets:

```dart
Container(
  width: 400,
  child: MovingDotStepper(
    stepCount: 4,
    currentStep: 1,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
    // Custom square dots instead of circles
    completedDot: Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(Icons.check, color: Colors.white, size: 16),
    ),
    activeDot: Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(Icons.edit, color: Colors.white, size: 16),
    ),
    inactiveDot: Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey, width: 2),
      ),
    ),
    onStepTapped: (index) {
      setState(() => currentStep = index);
    },
  ),
)
```

## Step Navigation

### Basic Step Control

The stepper's `currentStep` property determines which step is currently active. You can control step navigation in several ways:

#### 1. Using setState (Simple State Management)

```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int currentStep = 0;

  void nextStep() {
    if (currentStep < steps.length - 1) {
      setState(() => currentStep++);
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
    }
  }

  void goToStep(int index) {
    setState(() => currentStep = index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationStepper(
          steps: steps,
          currentStep: currentStep,
          onStepTapped: goToStep, // Tap on steps to navigate
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: currentStep > 0 ? previousStep : null,
              child: Text('Previous'),
            ),
            ElevatedButton(
              onPressed: currentStep < steps.length - 1 ? nextStep : null,
              child: Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}
```

#### 2. With Loading State During Async Operations

```dart
class _MyWidgetState extends State<MyWidget> {
  int currentStep = 0;
  bool isLoading = false;

  Future<void> nextStep() async {
    if (currentStep < steps.length - 1) {
      setState(() => isLoading = true);

      // Simulate async operation (API call, validation, etc.)
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        currentStep++;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationStepper(
          steps: steps,
          currentStep: currentStep,
          isLoading: isLoading,
        ),
        ElevatedButton(
          onPressed: !isLoading ? nextStep : null,
          child: isLoading
            ? CircularProgressIndicator()
            : Text('Next'),
        ),
      ],
    );
  }
}
```

### Using Riverpod for State Management

For more complex applications, you can use Riverpod to manage stepper state. Here's a complete example:

#### 1. Add Dependencies

```yaml
dependencies:
  flutter_animation_stepper: ^2.0.1
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0

dev_dependencies:
  riverpod_generator: ^2.3.0
  build_runner: ^2.4.0
```

#### 2. Create State Model

```dart
// lib/model/stepper_state.dart
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';

class StepperState {
  final int currentStep;
  final bool isLoading;
  final List<StepItem> steps;

  StepperState({
    required this.currentStep,
    required this.isLoading,
    required this.steps,
  });

  StepperState copyWith({
    int? currentStep,
    bool? isLoading,
    List<StepItem>? steps,
  }) {
    return StepperState(
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      steps: steps ?? this.steps,
    );
  }
}
```

#### 3. Create Controller with Riverpod

```dart
// lib/provider/stepper_controller.dart
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/stepper_state.dart';

part 'stepper_controller.g.dart';

@riverpod
class StepperController extends _$StepperController {
  @override
  StepperState build(List<StepItem> steps) {
    return StepperState(
      currentStep: 0,
      isLoading: false,
      steps: steps,
    );
  }

  // Move to next step with async operation
  Future<void> nextStep() async {
    if (state.currentStep < state.steps.length - 1) {
      // Show loading indicator
      state = state.copyWith(isLoading: true);

      // Simulate async operation (e.g., API call, validation)
      await Future.delayed(const Duration(seconds: 2));

      // Move to next step and clear loading
      state = state.copyWith(
        currentStep: state.currentStep + 1,
        isLoading: false,
      );
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < state.steps.length) {
      state = state.copyWith(currentStep: index);
    }
  }
}
```

#### 4. Generate Code

Run the build_runner to generate the provider code:

```bash
flutter pub run build_runner build
```

#### 5. Setup ProviderScope

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
```

#### 6. Use in Widget

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';

class MyStepperWidget extends ConsumerWidget {
  final List<StepItem> steps = [
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
  ];

  const MyStepperWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the stepper state
    final stepperState = ref.watch(stepperControllerProvider(steps));

    // Get the controller to call methods
    final controller = ref.read(stepperControllerProvider(steps).notifier);

    return Column(
      children: [
        // Stepper widget
        AnimationStepper(
          steps: stepperState.steps,
          currentStep: stepperState.currentStep,
          isLoading: stepperState.isLoading,
          onStepTapped: controller.goToStep,
        ),

        const SizedBox(height: 24),

        // Navigation controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: stepperState.currentStep > 0 && !stepperState.isLoading
                  ? controller.previousStep
                  : null,
              icon: const Icon(Icons.arrow_back),
              label: const Text('Previous'),
            ),
            Text(
              'Step ${stepperState.currentStep + 1} of ${stepperState.steps.length}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            ElevatedButton.icon(
              onPressed: stepperState.currentStep < stepperState.steps.length - 1 &&
                      !stepperState.isLoading
                  ? controller.nextStep
                  : null,
              icon: stepperState.isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.arrow_forward),
              label: const Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}
```

### MovingDotStepper with Riverpod

For MovingDotStepper, you can use a simpler controller:

```dart
// lib/provider/moving_dot_stepper_controller.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'moving_dot_stepper_controller.g.dart';

@riverpod
class MovingDotStepperController extends _$MovingDotStepperController {
  @override
  int build() => 0; // Initial step

  void nextStep(int maxSteps) {
    if (state < maxSteps - 1) {
      state = state + 1;
    }
  }

  void previousStep() {
    if (state > 0) {
      state = state - 1;
    }
  }

  void goToStep(int index, int maxSteps) {
    if (index >= 0 && index < maxSteps) {
      state = index;
    }
  }
}

// Usage in widget
class MyMovingDotWidget extends ConsumerWidget {
  final int stepCount = 4;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(movingDotStepperControllerProvider);
    final controller = ref.read(movingDotStepperControllerProvider.notifier);

    return Column(
      children: [
        MovingDotStepper(
          stepCount: stepCount,
          currentStep: currentStep,
          stepLabels: ['Start', 'Process', 'Review', 'Complete'],
          onStepTapped: (index) => controller.goToStep(index, stepCount),
        ),
        // Add navigation buttons...
      ],
    );
  }
}
```

## Additional Information

For more examples, check out the `/example` folder in the repository.

### Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Issues

If you encounter any issues, please report them on [GitHub Issues](https://github.com/your-username/flutter_animation_stepper/issues).

## License

This project is licensed under the MIT License.
