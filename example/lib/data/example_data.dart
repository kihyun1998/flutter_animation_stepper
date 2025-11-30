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

class MovingDotExampleData {
  final String title;
  final int stepCount;
  final List<String>? stepLabels;
  final Widget? completedIcon;
  final Widget? activeIcon;
  final Widget? inactiveIcon;
  final MovingDotStepperTheme? theme;
  final String? description;

  const MovingDotExampleData({
    required this.title,
    required this.stepCount,
    this.stepLabels,
    this.completedIcon,
    this.activeIcon,
    this.inactiveIcon,
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
  const StepItem(icon: Icon(Icons.shopping_cart), title: 'Cart'),
  const StepItem(icon: Icon(Icons.payment), title: 'Payment'),
  const StepItem(icon: Icon(Icons.local_shipping), title: 'Delivery'),
  const StepItem(icon: Icon(Icons.check_circle), title: 'Complete'),
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
  const StepItem(icon: Icon(Icons.account_circle), title: 'Account'),
  const StepItem(icon: Icon(Icons.verified_user), title: 'Verify'),
  const StepItem(icon: Icon(Icons.edit), title: 'Profile'),
  const StepItem(icon: Icon(Icons.settings), title: 'Settings'),
  const StepItem(icon: Icon(Icons.done), title: 'Done'),
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
  ExampleData(
    title: 'Line Horizontal Padding - None',
    description: 'Separated mode with no padding (default)',
    steps: stepsWithTitleOnly,
    theme: const AnimationStepperTheme(
      connectedLine: false,
      lineHorizontalPadding: 0.0,
      activeColor: Color(0xFF2196F3),
      completedColor: Color(0xFF4CAF50),
      lineThickness: 3,
    ),
  ),
  ExampleData(
    title: 'Line Horizontal Padding - Small',
    description: 'Separated mode with 10px padding on each side',
    steps: stepsWithTitleOnly,
    theme: const AnimationStepperTheme(
      connectedLine: false,
      lineHorizontalPadding: 10.0,
      activeColor: Color(0xFFFF9800),
      completedColor: Color(0xFFFF5722),
      lineThickness: 3,
    ),
  ),
  ExampleData(
    title: 'Line Horizontal Padding - Large',
    description: 'Separated mode with 20px padding on each side',
    steps: stepsWithTitleOnly,
    theme: const AnimationStepperTheme(
      connectedLine: false,
      lineHorizontalPadding: 20.0,
      activeColor: Color(0xFF9C27B0),
      completedColor: Color(0xFFE91E63),
      lineThickness: 3,
    ),
  ),
];

// MovingDotStepper examples
final allMovingDotExamples = [
  const MovingDotExampleData(
    title: 'Default Style',
    description: 'Basic moving dot stepper with labels',
    stepCount: 4,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
  ),
  const MovingDotExampleData(
    title: 'Custom Colors',
    description: 'Custom colors for active and completed states',
    stepCount: 4,
    stepLabels: ['Cart', 'Payment', 'Delivery', 'Done'],
    theme: MovingDotStepperTheme(
      activeColor: Color(0xFF6366F1),
      completedColor: Color(0xFF10B981),
      inactiveColor: Color(0xFFD1D5DB),
      activeLineColor: Color(0xFF6366F1),
      lineColor: Color(0xFFE5E7EB),
    ),
  ),
  const MovingDotExampleData(
    title: 'Large Dots',
    description: 'Bigger dots with custom spacing',
    stepCount: 5,
    stepLabels: ['Step 1', 'Step 2', 'Step 3', 'Step 4', 'Step 5'],
    theme: MovingDotStepperTheme(
      dotSize: 32.0,
      iconSize: 20.0,
      stepSpacing: 100.0,
      activeColor: Color(0xFFEC4899),
      completedColor: Color(0xFF8B5CF6),
    ),
  ),
  const MovingDotExampleData(
    title: 'Custom Icon',
    description: 'Star icon for completed steps',
    stepCount: 4,
    stepLabels: ['Begin', 'Work', 'Test', 'Finish'],
    completedIcon: Icon(Icons.star, color: Colors.white, size: 16),
    theme: MovingDotStepperTheme(
      activeColor: Color(0xFFF59E0B),
      completedColor: Color(0xFFF59E0B),
    ),
  ),
  const MovingDotExampleData(
    title: 'No Labels',
    description: 'Simple stepper without text labels',
    stepCount: 5,
    theme: MovingDotStepperTheme(
      activeColor: Color(0xFF14B8A6),
      completedColor: Color(0xFF0D9488),
      dotSize: 20.0,
      stepSpacing: 60.0,
    ),
  ),
  const MovingDotExampleData(
    title: 'Fast Animation',
    description: 'Quick transitions between steps',
    stepCount: 4,
    stepLabels: ['One', 'Two', 'Three', 'Four'],
    theme: MovingDotStepperTheme(
      animationDuration: Duration(milliseconds: 200),
      animationCurve: Curves.easeOut,
      activeColor: Color(0xFFEF4444),
      completedColor: Color(0xFF22C55E),
    ),
  ),
  const MovingDotExampleData(
    title: 'Slow Animation',
    description: 'Smooth and slower transitions',
    stepCount: 3,
    stepLabels: ['Alpha', 'Beta', 'Gamma'],
    theme: MovingDotStepperTheme(
      animationDuration: Duration(milliseconds: 800),
      animationCurve: Curves.easeInOutCubic,
      activeColor: Color(0xFF8B5CF6),
      completedColor: Color(0xFF06B6D4),
    ),
  ),
  const MovingDotExampleData(
    title: 'Thick Lines',
    description: 'Bold connecting lines between steps',
    stepCount: 4,
    stepLabels: ['First', 'Second', 'Third', 'Fourth'],
    theme: MovingDotStepperTheme(
      lineThickness: 4.0,
      activeColor: Color(0xFF3B82F6),
      completedColor: Color(0xFF10B981),
      activeLineColor: Color(0xFF3B82F6),
    ),
  ),
  const MovingDotExampleData(
    title: 'Zero Gap',
    description: 'Lines directly connected to dots (no gap)',
    stepCount: 4,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
    theme: MovingDotStepperTheme(
      linePadding: 0.0,
      activeColor: Color(0xFF6366F1),
      completedColor: Color(0xFF10B981),
      activeLineColor: Color(0xFF6366F1),
    ),
  ),
  const MovingDotExampleData(
    title: 'Default Gap',
    description: 'Independent line segments between dots',
    stepCount: 4,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
    theme: MovingDotStepperTheme(
      linePadding: 8.0,
      activeColor: Color(0xFF6366F1),
      completedColor: Color(0xFF10B981),
      activeLineColor: Color(0xFF6366F1),
    ),
  ),
  const MovingDotExampleData(
    title: 'Small Gap',
    description: 'Minimal padding between dots and lines',
    stepCount: 5,
    stepLabels: ['A', 'B', 'C', 'D', 'E'],
    theme: MovingDotStepperTheme(
      linePadding: 4.0,
      stepSpacing: 60.0,
      activeColor: Color(0xFFEC4899),
      completedColor: Color(0xFF8B5CF6),
      lineThickness: 3.0,
    ),
  ),
  const MovingDotExampleData(
    title: 'Large Gap',
    description: 'More spacing between dots and lines',
    stepCount: 3,
    stepLabels: ['Begin', 'Middle', 'End'],
    theme: MovingDotStepperTheme(
      linePadding: 16.0,
      stepSpacing: 120.0,
      dotSize: 28.0,
      iconSize: 18.0,
      activeColor: Color(0xFFF59E0B),
      completedColor: Color(0xFF10B981),
      activeLineColor: Color(0xFFF59E0B),
    ),
  ),
  const MovingDotExampleData(
    title: 'With Background Fill',
    description: 'Inactive dots with white background',
    stepCount: 4,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
    theme: MovingDotStepperTheme(
      inactiveFillColor: Colors.white,
      inactiveColor: Color(0xFFBDBDBD),
      activeColor: Color(0xFF6366F1),
      completedColor: Color(0xFF10B981),
    ),
  ),
  const MovingDotExampleData(
    title: 'Thick Border',
    description: 'Inactive dots with thicker border',
    stepCount: 4,
    stepLabels: ['One', 'Two', 'Three', 'Four'],
    theme: MovingDotStepperTheme(
      inactiveBorderWidth: 4.0,
      inactiveColor: Color(0xFFEC4899),
      activeColor: Color(0xFFEC4899),
      completedColor: Color(0xFF8B5CF6),
      dotSize: 28.0,
    ),
  ),
  const MovingDotExampleData(
    title: 'With Shadow',
    description: 'All dots have elevation shadow',
    stepCount: 4,
    stepLabels: ['Alpha', 'Beta', 'Gamma', 'Delta'],
    theme: MovingDotStepperTheme(
      dotShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
      ],
      activeColor: Color(0xFF3B82F6),
      completedColor: Color(0xFF10B981),
      inactiveFillColor: Colors.white,
    ),
  ),
  MovingDotExampleData(
    title: 'Background + Border + Shadow',
    description: 'All styling features combined',
    stepCount: 5,
    stepLabels: ['1', '2', '3', '4', '5'],
    theme: MovingDotStepperTheme(
      inactiveFillColor: const Color(0xFFF3F4F6),
      inactiveBorderWidth: 3.0,
      inactiveColor: const Color(0xFF9CA3AF),
      dotShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.15),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
      activeColor: const Color(0xFFEF4444),
      completedColor: const Color(0xFF22C55E),
      dotSize: 32.0,
      iconSize: 20.0,
      stepSpacing: 90.0,
      linePadding: 12.0,
    ),
  ),
  const MovingDotExampleData(
    title: 'Active as Outlined Circle',
    description: 'Active step with border only (empty circle)',
    stepCount: 4,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
    theme: MovingDotStepperTheme(
      activeFillColor: Colors.transparent,
      activeBorderColor: Color(0xFF6366F1),
      activeBorderWidth: 3.0,
      activeColor: Color(0xFF6366F1),
      completedColor: Color(0xFF10B981),
      inactiveFillColor: Colors.transparent,
      inactiveColor: Color(0xFFBDBDBD),
    ),
  ),
  const MovingDotExampleData(
    title: 'Active Thick Border',
    description: 'Active step with very thick outline',
    stepCount: 4,
    stepLabels: ['One', 'Two', 'Three', 'Four'],
    theme: MovingDotStepperTheme(
      activeFillColor: Colors.transparent,
      activeBorderColor: Color(0xFFEC4899),
      activeBorderWidth: 5.0,
      activeColor: Color(0xFFEC4899),
      completedColor: Color(0xFF8B5CF6),
      dotSize: 32.0,
    ),
  ),
  const MovingDotExampleData(
    title: 'Active with Background + Border',
    description: 'Active step with both fill and border',
    stepCount: 4,
    stepLabels: ['A', 'B', 'C', 'D'],
    theme: MovingDotStepperTheme(
      activeFillColor: Color(0xFFDCFCE7),
      activeBorderColor: Color(0xFF10B981),
      activeBorderWidth: 3.0,
      activeColor: Color(0xFF10B981),
      completedColor: Color(0xFF10B981),
      inactiveFillColor: Colors.white,
      inactiveColor: Color(0xFFD1D5DB),
    ),
  ),
  const MovingDotExampleData(
    title: 'Custom Icons (All States)',
    description: 'Different icons for inactive, active, and completed states',
    stepCount: 4,
    stepLabels: ['Start', 'Process', 'Review', 'Complete'],
    inactiveIcon: Icon(
      Icons.radio_button_unchecked,
      color: Color(0xFF9CA3AF),
      size: 16,
    ),
    activeIcon: Icon(Icons.play_circle_filled, color: Colors.white, size: 16),
    completedIcon: Icon(Icons.check_circle, color: Colors.white, size: 16),
    theme: MovingDotStepperTheme(
      activeColor: Color(0xFF6366F1),
      completedColor: Color(0xFF10B981),
      inactiveColor: Color(0xFFD1D5DB),
      inactiveFillColor: Colors.white,
      dotSize: 28.0,
    ),
  ),
  const MovingDotExampleData(
    title: 'Emoji Icons',
    description: 'Using emoji-style icons for all states',
    stepCount: 4,
    stepLabels: ['Queue', 'Active', 'Review', 'Done'],
    inactiveIcon: Icon(
      Icons.hourglass_empty,
      color: Color(0xFF9CA3AF),
      size: 14,
    ),
    activeIcon: Icon(Icons.hourglass_bottom, color: Colors.white, size: 14),
    completedIcon: Icon(Icons.verified, color: Colors.white, size: 14),
    theme: MovingDotStepperTheme(
      activeColor: Color(0xFFEC4899),
      completedColor: Color(0xFF8B5CF6),
      inactiveColor: Color(0xFFBDBDBD),
      inactiveFillColor: Color(0xFFF3F4F6),
      dotSize: 30.0,
    ),
  ),
  const MovingDotExampleData(
    title: 'Number Icons',
    description: 'Numbers in inactive/active, check in completed',
    stepCount: 5,
    stepLabels: ['One', 'Two', 'Three', 'Four', 'Five'],
    inactiveIcon: Icon(
      Icons.circle_outlined,
      color: Color(0xFF9CA3AF),
      size: 12,
    ),
    activeIcon: Icon(Icons.circle, color: Colors.white, size: 12),
    completedIcon: Icon(Icons.check, color: Colors.white, size: 14),
    theme: MovingDotStepperTheme(
      activeColor: Color(0xFF3B82F6),
      completedColor: Color(0xFF22C55E),
      inactiveColor: Color(0xFFD1D5DB),
      dotSize: 26.0,
      stepSpacing: 70.0,
    ),
  ),
  const MovingDotExampleData(
    title: 'Arrow Progress',
    description: 'Arrow icons showing progress direction',
    stepCount: 4,
    stepLabels: ['Begin', 'Work', 'Test', 'Ship'],
    inactiveIcon: Icon(
      Icons.arrow_forward_ios,
      color: Color(0xFFBDBDBD),
      size: 12,
    ),
    activeIcon: Icon(Icons.double_arrow, color: Colors.white, size: 14),
    completedIcon: Icon(Icons.done_all, color: Colors.white, size: 14),
    theme: MovingDotStepperTheme(
      activeColor: Color(0xFFF59E0B),
      completedColor: Color(0xFF10B981),
      inactiveColor: Color(0xFFE5E7EB),
      inactiveFillColor: Colors.white,
      dotSize: 32.0,
      stepSpacing: 90.0,
    ),
  ),
];
