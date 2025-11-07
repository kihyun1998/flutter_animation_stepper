import 'package:flutter/widgets.dart';

/// Represents a single step in the [AnimationStepper] widget.
///
/// Each [StepItem] defines the visual appearance and optional data for a step
/// in the stepper. Steps can have icons, titles, subtitles, and associated data.
///
/// Example:
/// ```dart
/// final step = StepItem(
///   icon: Icon(Icons.home),
///   title: 'Home',
///   subtitle: 'Main page',
///   data: {'route': '/home'},
/// );
/// ```
///
/// See also:
/// * [AnimationStepper], which displays a list of [StepItem]s.
class StepItem {
  /// The widget to display as the step icon.
  ///
  /// This can be any Flutter widget, including:
  /// - [Icon] widgets from Material or Cupertino libraries
  /// - [Image] widgets for custom graphics
  /// - SVG widgets from flutter_svg package
  /// - Custom widgets for complex step indicators
  ///
  /// The icon will be displayed inside a circular container and automatically
  /// colored based on the step's state (active, completed, or inactive).
  ///
  /// Example:
  /// ```dart
  /// StepItem(
  ///   icon: Icon(Icons.check_circle),
  ///   title: 'Completed',
  /// )
  /// ```
  final Widget icon;

  /// Optional title text displayed below the step icon.
  ///
  /// The title is typically a short label that describes the step.
  /// It will be styled according to the step's state using the theme's
  /// title style properties.
  ///
  /// If null, no title will be displayed.
  ///
  /// Example:
  /// ```dart
  /// StepItem(
  ///   icon: Icon(Icons.shopping_cart),
  ///   title: 'Cart', // Short, descriptive label
  /// )
  /// ```
  final String? title;

  /// Optional subtitle text displayed below the title.
  ///
  /// The subtitle provides additional context or information about the step.
  /// It is typically displayed in a smaller, lighter font than the title.
  ///
  /// If null, no subtitle will be displayed.
  ///
  /// Example:
  /// ```dart
  /// StepItem(
  ///   icon: Icon(Icons.payment),
  ///   title: 'Payment',
  ///   subtitle: 'Enter card details', // Additional context
  /// )
  /// ```
  final String? subtitle;

  /// Optional data associated with this step.
  ///
  /// This field can store any type of data related to the step, such as:
  /// - Route information for navigation
  /// - Form data or validation state
  /// - Step-specific configuration
  /// - Custom metadata
  ///
  /// The data is not displayed but can be accessed programmatically
  /// to implement custom behavior.
  ///
  /// Example:
  /// ```dart
  /// StepItem(
  ///   icon: Icon(Icons.location_on),
  ///   title: 'Address',
  ///   data: {
  ///     'required': true,
  ///     'validated': false,
  ///     'route': '/address',
  ///   },
  /// )
  /// ```
  final dynamic data;

  /// Creates a [StepItem].
  ///
  /// The [icon] parameter is required and defines the visual indicator
  /// for this step.
  ///
  /// The [title], [subtitle], and [data] parameters are optional and
  /// provide additional information about the step.
  const StepItem({
    required this.icon,
    this.title,
    this.subtitle,
    this.data,
  });
}
