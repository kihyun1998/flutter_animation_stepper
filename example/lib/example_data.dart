import 'package:flutter/material.dart';
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';

class ExampleData {
  final String title;
  final List<StepItem> steps;
  final AnimationStepperTheme? theme;
  final String? description;

  const ExampleData({
    required this.title,
    required this.steps,
    this.theme,
    this.description,
  });
}

// Steps with title and subtitle
final stepsWithTitleAndSubtitle = [
  const StepItem(
    icon: Icon(Icons.shopping_cart),
    title: 'Cart',
    subtitle: 'Add items',
  ),
  const StepItem(
    icon: Icon(Icons.payment),
    title: 'Payment',
    subtitle: 'Choose method',
  ),
  const StepItem(
    icon: Icon(Icons.local_shipping),
    title: 'Delivery',
    subtitle: 'Enter address',
  ),
  const StepItem(
    icon: Icon(Icons.check_circle),
    title: 'Complete',
    subtitle: 'Order placed',
  ),
];

// Steps with title only (no subtitle)
final stepsWithTitleOnly = [
  const StepItem(
    icon: Icon(Icons.shopping_cart),
    title: 'Cart',
  ),
  const StepItem(
    icon: Icon(Icons.payment),
    title: 'Payment',
  ),
  const StepItem(
    icon: Icon(Icons.local_shipping),
    title: 'Delivery',
  ),
  const StepItem(
    icon: Icon(Icons.check_circle),
    title: 'Complete',
  ),
];

// Steps with icon only (no title, no subtitle)
final stepsIconOnly = [
  const StepItem(icon: Icon(Icons.shopping_cart)),
  const StepItem(icon: Icon(Icons.payment)),
  const StepItem(icon: Icon(Icons.local_shipping)),
  const StepItem(icon: Icon(Icons.check_circle)),
];

// Steps with more items for wide spacing example
final stepsForWideSpacing = [
  const StepItem(
    icon: Icon(Icons.account_circle),
    title: 'Account',
  ),
  const StepItem(
    icon: Icon(Icons.verified_user),
    title: 'Verify',
  ),
  const StepItem(
    icon: Icon(Icons.edit),
    title: 'Profile',
  ),
  const StepItem(
    icon: Icon(Icons.settings),
    title: 'Settings',
  ),
  const StepItem(
    icon: Icon(Icons.done),
    title: 'Done',
  ),
];

// All examples
final allExamples = [
  ExampleData(
    title: 'Default Theme',
    description: 'Basic stepper with title and subtitle',
    steps: stepsWithTitleAndSubtitle,
  ),
  ExampleData(
    title: 'Custom Theme',
    description: 'Custom colors and sizes',
    steps: stepsWithTitleAndSubtitle,
    theme: AnimationStepperTheme(
      activeColor: Colors.purple,
      completedColor: Colors.green,
      inactiveColor: Colors.grey.shade300,
      activeLineColor: Colors.purple,
      lineColor: Colors.grey.shade300,
      stepSize: 50,
      lineThickness: 3,
      animationDuration: const Duration(milliseconds: 500),
      animationCurve: Curves.easeInOutCubic,
      activeTitleStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    ),
  ),
  ExampleData(
    title: 'Connected Line Style',
    description: 'Steps with connected lines',
    steps: stepsWithTitleAndSubtitle,
    theme: const AnimationStepperTheme(
      connectedLine: true,
      activeColor: Color(0xFFFF6B6B),
      completedColor: Color(0xFF4ECDC4),
      inactiveColor: Color(0xFFE0E0E0),
      activeLineColor: Color(0xFFFF6B6B),
      lineColor: Color(0xFFE0E0E0),
      lineThickness: 4,
    ),
  ),
  ExampleData(
    title: 'Title Only',
    description: 'Steps without subtitle',
    steps: stepsWithTitleOnly,
    theme: const AnimationStepperTheme(
      activeColor: Color(0xFF00BCD4),
      completedColor: Color(0xFF009688),
      stepSize: 45,
    ),
  ),
  ExampleData(
    title: 'Icon Only',
    description: 'Minimal design with icons only',
    steps: stepsIconOnly,
    theme: const AnimationStepperTheme(
      activeColor: Color(0xFFFF9800),
      completedColor: Color(0xFFFF5722),
      stepSize: 48,
      lineThickness: 3,
    ),
  ),
  ExampleData(
    title: 'Wide Spacing',
    description: 'Larger gap between steps',
    steps: stepsForWideSpacing,
    theme: const AnimationStepperTheme(
      stepSpacing: 150,
      activeColor: Color(0xFF673AB7),
      completedColor: Color(0xFF9C27B0),
      stepSize: 40,
      connectedLine: true,
    ),
  ),
  ExampleData(
    title: 'Compact Style',
    description: 'Tight spacing with small steps',
    steps: stepsWithTitleOnly,
    theme: const AnimationStepperTheme(
      stepSpacing: 60,
      stepSize: 32,
      lineThickness: 2,
      activeColor: Color(0xFF3F51B5),
      completedColor: Color(0xFF5C6BC0),
    ),
  ),
  ExampleData(
    title: 'Large Steps',
    description: 'Big step circles with custom animation',
    steps: stepsWithTitleAndSubtitle,
    theme: const AnimationStepperTheme(
      stepSize: 60,
      stepIconPadding: 16,
      lineThickness: 4,
      animationDuration: Duration(milliseconds: 600),
      animationCurve: Curves.bounceOut,
      activeColor: Color(0xFFE91E63),
      completedColor: Color(0xFFF06292),
    ),
  ),
];
