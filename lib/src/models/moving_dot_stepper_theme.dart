import 'package:flutter/material.dart';

/// Defines the visual properties for a [MovingDotStepper] widget.
///
/// This theme class provides customization options for the moving dot stepper's
/// appearance, including colors, sizes, spacing, and animations.
///
/// Example:
/// ```dart
/// MovingDotStepper(
///   stepCount: 4,
///   currentStep: 1,
///   theme: MovingDotStepperTheme(
///     activeColor: Colors.blue,
///     completedColor: Colors.green,
///     dotSize: 24.0,
///     animationDuration: Duration(milliseconds: 400),
///   ),
/// )
/// ```
class MovingDotStepperTheme {
  // Colors
  /// The color used for the active (current) step dot.
  ///
  /// This is used as the default fill color when [activeFillColor] is not specified.
  ///
  /// Defaults to `Color(0xFF2196F3)` (Material Blue).
  final Color activeColor;

  /// The fill color inside the active (current) step dot.
  ///
  /// When set to a non-transparent color, creates a filled circle.
  /// Set to `Colors.transparent` for an empty circle with border only.
  ///
  /// If null, uses [activeColor] as the fill color.
  final Color? activeFillColor;

  /// The border color of the active (current) step dot.
  ///
  /// When specified, adds a border around the active step circle.
  /// Useful for creating outlined active states.
  ///
  /// If null, no border is applied (filled circle only).
  final Color? activeBorderColor;

  /// The border width of the active step dot.
  ///
  /// Only applies when [activeBorderColor] is specified.
  ///
  /// Defaults to `2.0`.
  final double activeBorderWidth;

  /// The color used for inactive (upcoming) steps border.
  ///
  /// Applied to the border of steps that haven't been reached yet.
  ///
  /// Defaults to `Color(0xFFBDBDBD)` (Material Grey).
  final Color inactiveColor;

  /// The fill color inside inactive (upcoming) step dots.
  ///
  /// When set to a non-transparent color, the empty circle will have a background.
  ///
  /// Defaults to `Colors.transparent`.
  final Color inactiveFillColor;

  /// The color used for completed steps.
  ///
  /// Applied to the checkmark icon and circle background of completed steps.
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
  /// The diameter of the step dot (circle) in logical pixels.
  ///
  /// This determines the size of the circular indicator for each step.
  ///
  /// Defaults to `24.0`.
  final double dotSize;

  /// The thickness of the connecting line between steps in logical pixels.
  ///
  /// This affects the height of the horizontal line that connects step dots.
  ///
  /// Defaults to `2.0`.
  final double lineThickness;

  /// The horizontal distance between step dot centers.
  ///
  /// This value determines the spacing of the stepper layout.
  ///
  /// Defaults to `80.0`.
  final double stepSpacing;

  /// The size of the completed icon in logical pixels.
  ///
  /// This determines how large the checkmark (or custom completed icon) appears.
  ///
  /// Defaults to `16.0`.
  final double iconSize;

  /// The vertical spacing between the step dot and its label text.
  ///
  /// Only applies when steps have labels. Measured in logical pixels.
  ///
  /// Defaults to `8.0`.
  final double labelSpacing;

  /// Horizontal padding between dots and lines.
  ///
  /// Creates visual spacing between each dot and its adjacent line segments.
  /// Set to 0.0 for lines directly connected to dots.
  ///
  /// Defaults to `8.0`.
  final double linePadding;

  /// The border width of inactive step dots.
  ///
  /// Controls the thickness of the circle outline for steps that haven't been reached.
  ///
  /// Defaults to `2.0`.
  final double inactiveBorderWidth;

  /// Shadow applied to all step dots.
  ///
  /// When provided, adds depth and elevation to the step indicators.
  ///
  /// Example:
  /// ```dart
  /// dotShadow: [
  ///   BoxShadow(
  ///     color: Colors.black26,
  ///     blurRadius: 4,
  ///     offset: Offset(0, 2),
  ///   ),
  /// ]
  /// ```
  ///
  /// Defaults to `null` (no shadow).
  final List<BoxShadow>? dotShadow;

  // Animation
  /// The duration of step transition animations.
  ///
  /// This controls how long it takes for:
  /// - Dots to fade between states (active, completed, inactive)
  /// - Connecting lines to fill/empty when moving between steps
  /// - The moving dot indicator to transition to the next position
  ///
  /// Defaults to `Duration(milliseconds: 400)`.
  final Duration animationDuration;

  /// The animation curve used for step transitions.
  ///
  /// This defines the rate of change during animations.
  ///
  /// Defaults to [Curves.easeInOut].
  final Curve animationCurve;

  // Text Styles
  /// The text style for the active step's label.
  ///
  /// If null, a default style is used with [activeColor] and bold font weight.
  final TextStyle? activeLabelStyle;

  /// The text style for inactive step labels.
  ///
  /// If null, a default style is used with [inactiveColor].
  final TextStyle? inactiveLabelStyle;

  /// The text style for completed step labels.
  ///
  /// If null, a default style is used with [completedColor].
  final TextStyle? completedLabelStyle;

  /// Creates a [MovingDotStepperTheme] with customizable properties.
  ///
  /// All parameters are optional and have sensible defaults that follow
  /// Material Design guidelines.
  const MovingDotStepperTheme({
    this.activeColor = const Color(0xFF2196F3),
    this.activeFillColor,
    this.activeBorderColor,
    this.activeBorderWidth = 2.0,
    this.inactiveColor = const Color(0xFFBDBDBD),
    this.inactiveFillColor = Colors.transparent,
    this.completedColor = const Color(0xFF4CAF50),
    this.lineColor = const Color(0xFFE0E0E0),
    this.activeLineColor = const Color(0xFF2196F3),
    this.dotSize = 24.0,
    this.lineThickness = 2.0,
    this.stepSpacing = 80.0,
    this.iconSize = 16.0,
    this.labelSpacing = 8.0,
    this.linePadding = 8.0,
    this.inactiveBorderWidth = 2.0,
    this.dotShadow,
    this.animationDuration = const Duration(milliseconds: 400),
    this.animationCurve = Curves.easeInOut,
    this.activeLabelStyle,
    this.inactiveLabelStyle,
    this.completedLabelStyle,
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  MovingDotStepperTheme copyWith({
    Color? activeColor,
    Color? activeFillColor,
    Color? activeBorderColor,
    double? activeBorderWidth,
    Color? inactiveColor,
    Color? inactiveFillColor,
    Color? completedColor,
    Color? lineColor,
    Color? activeLineColor,
    double? dotSize,
    double? lineThickness,
    double? stepSpacing,
    double? iconSize,
    double? labelSpacing,
    double? linePadding,
    double? inactiveBorderWidth,
    List<BoxShadow>? dotShadow,
    Duration? animationDuration,
    Curve? animationCurve,
    TextStyle? activeLabelStyle,
    TextStyle? inactiveLabelStyle,
    TextStyle? completedLabelStyle,
  }) {
    return MovingDotStepperTheme(
      activeColor: activeColor ?? this.activeColor,
      activeFillColor: activeFillColor ?? this.activeFillColor,
      activeBorderColor: activeBorderColor ?? this.activeBorderColor,
      activeBorderWidth: activeBorderWidth ?? this.activeBorderWidth,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      inactiveFillColor: inactiveFillColor ?? this.inactiveFillColor,
      completedColor: completedColor ?? this.completedColor,
      lineColor: lineColor ?? this.lineColor,
      activeLineColor: activeLineColor ?? this.activeLineColor,
      dotSize: dotSize ?? this.dotSize,
      lineThickness: lineThickness ?? this.lineThickness,
      stepSpacing: stepSpacing ?? this.stepSpacing,
      iconSize: iconSize ?? this.iconSize,
      labelSpacing: labelSpacing ?? this.labelSpacing,
      linePadding: linePadding ?? this.linePadding,
      inactiveBorderWidth: inactiveBorderWidth ?? this.inactiveBorderWidth,
      dotShadow: dotShadow ?? this.dotShadow,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      activeLabelStyle: activeLabelStyle ?? this.activeLabelStyle,
      inactiveLabelStyle: inactiveLabelStyle ?? this.inactiveLabelStyle,
      completedLabelStyle: completedLabelStyle ?? this.completedLabelStyle,
    );
  }
}
