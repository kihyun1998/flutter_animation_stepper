import 'package:flutter/widgets.dart';

/// Represents a single step in the stepper
class StepItem {
  /// The widget to display as the step icon
  /// Can be any widget including SVG, Icon, Image, or custom widgets
  final Widget icon;

  /// Optional title text displayed below the step
  final String? title;

  /// Optional subtitle text displayed below the title
  final String? subtitle;

  /// Optional data associated with this step
  final dynamic data;

  const StepItem({
    required this.icon,
    this.title,
    this.subtitle,
    this.data,
  });
}
