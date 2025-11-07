import 'package:flutter/material.dart';

/// Theme configuration for the AnimationStepper widget
class AnimationStepperTheme {
  // Colors
  /// Color for the active (current) step
  final Color activeColor;

  /// Color for inactive (upcoming) steps
  final Color inactiveColor;

  /// Color for completed steps
  final Color completedColor;

  /// Color for the line between steps when inactive
  final Color lineColor;

  /// Color for the line between steps when active/completed
  final Color activeLineColor;

  // Sizes
  /// Size of the step circle/icon container
  final double stepSize;

  /// Thickness of the connecting line between steps
  final double lineThickness;

  /// Spacing between step and text
  final double stepTextSpacing;

  /// Padding inside the step circle
  final double stepIconPadding;

  /// Spacing between step circles (width between step centers)
  final double stepSpacing;

  /// Stroke width of the loading indicator
  final double loadingIndicatorStrokeWidth;

  /// Horizontal padding for lines in separated layout mode (connectedLine = false)
  /// This adds spacing between the line and step circles
  final double lineHorizontalPadding;

  // Layout
  /// Whether the connecting line is integrated with step circles (no gap)
  /// When true, the line connects directly to the step circles
  /// When false, there is a gap between the step and the line
  final bool connectedLine;

  // Animation
  /// Duration of the step transition animation
  final Duration animationDuration;

  /// Curve for the step transition animation
  final Curve animationCurve;

  // Text Styles
  /// Text style for active step title
  final TextStyle? activeTitleStyle;

  /// Text style for inactive step title
  final TextStyle? inactiveTitleStyle;

  /// Text style for completed step title
  final TextStyle? completedTitleStyle;

  /// Text style for subtitle
  final TextStyle? subtitleStyle;

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

  /// Creates a copy of this theme with the given fields replaced with new values
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
