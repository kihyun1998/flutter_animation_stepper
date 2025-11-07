import 'package:flutter/material.dart';

/// Defines the visual properties for an [AnimationStepper] widget.
///
/// This theme class provides extensive customization options for the stepper's
/// appearance, including colors, sizes, spacing, animations, and text styles.
///
/// Use this class to create a consistent look for your stepper or to match
/// your app's design system.
///
/// Example:
/// ```dart
/// AnimationStepper(
///   steps: steps,
///   currentStep: 0,
///   theme: AnimationStepperTheme(
///     activeColor: Colors.blue,
///     completedColor: Colors.green,
///     stepSize: 50.0,
///     lineThickness: 3.0,
///     animationDuration: Duration(milliseconds: 500),
///   ),
/// )
/// ```
///
/// You can also use [copyWith] to modify specific properties:
/// ```dart
/// final customTheme = AnimationStepperTheme().copyWith(
///   activeColor: Colors.purple,
///   stepSize: 60.0,
/// );
/// ```
///
/// See also:
/// * [AnimationStepper], which uses this theme for styling.
class AnimationStepperTheme {
  // Colors
  /// The color used for the active (current) step circle and text.
  ///
  /// This color is applied to:
  /// - The step circle background
  /// - The loading indicator (if [AnimationStepper.isLoading] is true)
  /// - The title text (unless [activeTitleStyle] overrides it)
  ///
  /// Defaults to `Color(0xFF2196F3)` (Material Blue).
  final Color activeColor;

  /// The color used for inactive (upcoming) steps.
  ///
  /// Applied to steps that haven't been reached yet (index > currentStep).
  ///
  /// Defaults to `Color(0xFFBDBDBD)` (Material Grey).
  final Color inactiveColor;

  /// The color used for completed steps.
  ///
  /// Applied to all steps before the current step (index < currentStep).
  ///
  /// Defaults to `Color(0xFF4CAF50)` (Material Green).
  final Color completedColor;

  /// The color of the connecting line between steps in its inactive state.
  ///
  /// This is the background color of lines that haven't been reached yet.
  ///
  /// Defaults to `Color(0xFFE0E0E0)` (Light Grey).
  final Color lineColor;

  /// The color of the connecting line when active or completed.
  ///
  /// This color fills the line with an animated progress as steps are completed.
  ///
  /// Defaults to `Color(0xFF2196F3)` (Material Blue).
  final Color activeLineColor;

  // Sizes
  /// The diameter of the step circle container in logical pixels.
  ///
  /// This determines the size of the circular background that contains
  /// the step icon. The actual icon size will be smaller due to [stepIconPadding].
  ///
  /// Defaults to `40.0`.
  final double stepSize;

  /// The thickness of the connecting line between steps in logical pixels.
  ///
  /// This affects the height of the horizontal line that connects step circles.
  ///
  /// Defaults to `2.0`.
  final double lineThickness;

  /// The vertical spacing between the step circle and its title text.
  ///
  /// Only applies when steps have a title. Measured in logical pixels.
  ///
  /// Defaults to `8.0`.
  final double stepTextSpacing;

  /// The padding inside the step circle around the icon.
  ///
  /// This creates space between the circle's edge and the icon widget.
  /// Larger values result in smaller icons within the same [stepSize].
  ///
  /// Defaults to `8.0`.
  final double stepIconPadding;

  /// The horizontal distance between step circle centers.
  ///
  /// This value determines the spacing of the stepper layout. In separated
  /// layout mode ([connectedLine] = false), this is the width of the
  /// line segment between steps. In connected mode, it affects overall width.
  ///
  /// Defaults to `80.0`.
  final double stepSpacing;

  /// The stroke width of the circular loading indicator.
  ///
  /// The loading indicator appears around the active step when
  /// [AnimationStepper.isLoading] is true.
  ///
  /// Defaults to `2.5`.
  final double loadingIndicatorStrokeWidth;

  /// Horizontal padding applied to lines in separated layout mode.
  ///
  /// When [connectedLine] is false, this adds horizontal spacing between
  /// the connecting line and the step circles, creating a visual gap.
  ///
  /// Defaults to `0.0`.
  final double lineHorizontalPadding;

  // Layout
  /// Determines the layout mode for connecting lines.
  ///
  /// When `true`:
  /// - Lines connect directly to step circles with no gap
  /// - Creates a continuous, integrated visual appearance
  /// - Uses Stack-based layout for precise positioning
  ///
  /// When `false`:
  /// - Lines are separated from step circles
  /// - Creates distinct visual separation between steps and connectors
  /// - [lineHorizontalPadding] can be used to control the gap size
  ///
  /// Defaults to `false`.
  final bool connectedLine;

  // Animation
  /// The duration of step transition animations.
  ///
  /// This controls how long it takes for:
  /// - Step colors to change when transitioning between states
  /// - Connecting lines to fill/empty when moving between steps
  /// - Loading indicator to fade in/out
  ///
  /// Defaults to `Duration(milliseconds: 300)`.
  final Duration animationDuration;

  /// The animation curve used for step transitions.
  ///
  /// This defines the rate of change during animations. Common curves include:
  /// - [Curves.easeInOut]: Smooth acceleration and deceleration (default)
  /// - [Curves.linear]: Constant speed
  /// - [Curves.fastOutSlowIn]: Material Design standard
  ///
  /// Defaults to [Curves.easeInOut].
  final Curve animationCurve;

  // Text Styles
  /// The text style for the active step's title.
  ///
  /// If null, a default style is used with [activeColor] and bold font weight.
  ///
  /// Example:
  /// ```dart
  /// AnimationStepperTheme(
  ///   activeTitleStyle: TextStyle(
  ///     fontSize: 14,
  ///     fontWeight: FontWeight.bold,
  ///     color: Colors.blue,
  ///   ),
  /// )
  /// ```
  final TextStyle? activeTitleStyle;

  /// The text style for inactive step titles.
  ///
  /// If null, a default style is used with [inactiveColor].
  final TextStyle? inactiveTitleStyle;

  /// The text style for completed step titles.
  ///
  /// If null, a default style is used with [completedColor] and semi-bold font weight.
  final TextStyle? completedTitleStyle;

  /// The text style for step subtitles.
  ///
  /// Applied to all subtitle text regardless of step state.
  /// If null, a default style is used with grey color and smaller font size.
  final TextStyle? subtitleStyle;

  /// Creates an [AnimationStepperTheme] with customizable properties.
  ///
  /// All parameters are optional and have sensible defaults that follow
  /// Material Design guidelines.
  ///
  /// Example:
  /// ```dart
  /// const theme = AnimationStepperTheme(
  ///   activeColor: Colors.purple,
  ///   completedColor: Colors.deepPurple,
  ///   stepSize: 50.0,
  ///   animationDuration: Duration(milliseconds: 500),
  ///   connectedLine: true,
  /// );
  /// ```
  const AnimationStepperTheme({
    this.activeColor = const Color(0xFF2196F3),
    this.inactiveColor = const Color(0xFFBDBDBD),
    this.completedColor = const Color(0xFF4CAF50),
    this.lineColor = const Color(0xFFE0E0E0),
    this.activeLineColor = const Color(0xFF2196F3),
    this.stepSize = 40.0,
    this.lineThickness = 2.0,
    this.stepTextSpacing = 8.0,
    this.stepIconPadding = 8.0,
    this.stepSpacing = 80.0,
    this.loadingIndicatorStrokeWidth = 2.5,
    this.lineHorizontalPadding = 0.0,
    this.connectedLine = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.activeTitleStyle,
    this.inactiveTitleStyle,
    this.completedTitleStyle,
    this.subtitleStyle,
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  ///
  /// This is useful for creating theme variations without repeating all properties.
  ///
  /// Example:
  /// ```dart
  /// final baseTheme = AnimationStepperTheme();
  /// final darkTheme = baseTheme.copyWith(
  ///   activeColor: Colors.deepPurple,
  ///   inactiveColor: Colors.grey[700],
  ///   lineColor: Colors.grey[800],
  /// );
  /// ```
  AnimationStepperTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? completedColor,
    Color? lineColor,
    Color? activeLineColor,
    double? stepSize,
    double? lineThickness,
    double? stepTextSpacing,
    double? stepIconPadding,
    double? stepSpacing,
    double? loadingIndicatorStrokeWidth,
    double? lineHorizontalPadding,
    bool? connectedLine,
    Duration? animationDuration,
    Curve? animationCurve,
    TextStyle? activeTitleStyle,
    TextStyle? inactiveTitleStyle,
    TextStyle? completedTitleStyle,
    TextStyle? subtitleStyle,
  }) {
    return AnimationStepperTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      completedColor: completedColor ?? this.completedColor,
      lineColor: lineColor ?? this.lineColor,
      activeLineColor: activeLineColor ?? this.activeLineColor,
      stepSize: stepSize ?? this.stepSize,
      lineThickness: lineThickness ?? this.lineThickness,
      stepTextSpacing: stepTextSpacing ?? this.stepTextSpacing,
      stepIconPadding: stepIconPadding ?? this.stepIconPadding,
      stepSpacing: stepSpacing ?? this.stepSpacing,
      loadingIndicatorStrokeWidth: loadingIndicatorStrokeWidth ?? this.loadingIndicatorStrokeWidth,
      lineHorizontalPadding: lineHorizontalPadding ?? this.lineHorizontalPadding,
      connectedLine: connectedLine ?? this.connectedLine,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      activeTitleStyle: activeTitleStyle ?? this.activeTitleStyle,
      inactiveTitleStyle: inactiveTitleStyle ?? this.inactiveTitleStyle,
      completedTitleStyle: completedTitleStyle ?? this.completedTitleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
    );
  }
}
