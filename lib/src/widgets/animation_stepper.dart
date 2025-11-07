import 'package:flutter/material.dart';

import '../models/animation_stepper_theme.dart';
import '../models/step_item.dart';

/// A horizontal stepper widget with smooth animations between steps.
///
/// [AnimationStepper] displays a horizontal sequence of steps with animated
/// transitions. Each step can have an icon, title, subtitle, and associated data.
/// The widget automatically animates color changes and line progress when
/// moving between steps.
///
/// ## Features
///
/// - Smooth color transitions between step states (active, completed, inactive)
/// - Animated progress lines between steps
/// - Optional loading indicator for async operations
/// - Customizable theme for colors, sizes, and animations
/// - Support for step tapping to navigate
/// - Two layout modes: connected and separated lines
/// - Horizontal scrolling for overflow
///
/// ## Basic Usage
///
/// ```dart
/// AnimationStepper(
///   steps: [
///     StepItem(
///       icon: Icon(Icons.shopping_cart),
///       title: 'Cart',
///       subtitle: 'Review items',
///     ),
///     StepItem(
///       icon: Icon(Icons.payment),
///       title: 'Payment',
///       subtitle: 'Enter details',
///     ),
///     StepItem(
///       icon: Icon(Icons.check_circle),
///       title: 'Confirm',
///       subtitle: 'Complete order',
///     ),
///   ],
///   currentStep: 1, // Payment step is active
///   onStepTapped: (index) {
///     setState(() => currentStep = index);
///   },
/// )
/// ```
///
/// ## Loading State
///
/// Show a loading indicator on the current step during async operations:
///
/// ```dart
/// AnimationStepper(
///   steps: steps,
///   currentStep: currentStep,
///   isLoading: isProcessing, // Shows CircularProgressIndicator
/// )
/// ```
///
/// ## Custom Theme
///
/// Customize appearance using [AnimationStepperTheme]:
///
/// ```dart
/// AnimationStepper(
///   steps: steps,
///   currentStep: 0,
///   theme: AnimationStepperTheme(
///     activeColor: Colors.purple,
///     completedColor: Colors.green,
///     stepSize: 50.0,
///     stepSpacing: 100.0,
///     connectedLine: true,
///     animationDuration: Duration(milliseconds: 500),
///   ),
/// )
/// ```
///
/// See also:
/// * [StepItem], which defines individual step properties.
/// * [AnimationStepperTheme], which customizes the stepper's appearance.
class AnimationStepper extends StatefulWidget {
  /// The list of steps to display in the stepper.
  ///
  /// Must not be empty. Each [StepItem] represents a step in the process.
  ///
  /// Example:
  /// ```dart
  /// steps: [
  ///   StepItem(icon: Icon(Icons.home), title: 'Home'),
  ///   StepItem(icon: Icon(Icons.settings), title: 'Settings'),
  /// ]
  /// ```
  final List<StepItem> steps;

  /// The index of the currently active step (0-based).
  ///
  /// Must be greater than or equal to 0 and less than the length of [steps].
  /// Steps before this index are marked as completed, and steps after are inactive.
  ///
  /// When this value changes, the stepper animates the transition.
  final int currentStep;

  /// Whether the current step is in a loading state.
  ///
  /// When `true`, a [CircularProgressIndicator] appears around the active step,
  /// and step tapping is disabled for the loading step.
  ///
  /// Defaults to `false`.
  ///
  /// Example:
  /// ```dart
  /// AnimationStepper(
  ///   steps: steps,
  ///   currentStep: 1,
  ///   isLoading: true, // Shows loading indicator on step 1
  /// )
  /// ```
  final bool isLoading;

  /// Called when a step is tapped by the user.
  ///
  /// The callback receives the index of the tapped step. This is only triggered
  /// if [enableStepTapping] is `true` and the step is not currently loading.
  ///
  /// If null, steps can still be tapped but no action is taken.
  ///
  /// Example:
  /// ```dart
  /// AnimationStepper(
  ///   steps: steps,
  ///   currentStep: currentStep,
  ///   onStepTapped: (index) {
  ///     if (index <= completedSteps) {
  ///       setState(() => currentStep = index);
  ///     }
  ///   },
  /// )
  /// ```
  final ValueChanged<int>? onStepTapped;

  /// The theme configuration for customizing the stepper's appearance.
  ///
  /// Controls colors, sizes, spacing, animations, and text styles.
  ///
  /// Defaults to [AnimationStepperTheme()] with Material Design default values.
  ///
  /// See [AnimationStepperTheme] for all available customization options.
  final AnimationStepperTheme theme;

  /// Whether steps can be tapped to trigger [onStepTapped].
  ///
  /// When `false`, steps are not interactive and tapping has no effect.
  /// When `true`, tapping a step calls [onStepTapped] (if provided).
  ///
  /// Note: The loading step is never tappable, regardless of this setting.
  ///
  /// Defaults to `true`.
  final bool enableStepTapping;

  /// Creates an [AnimationStepper].
  ///
  /// The [steps] and [currentStep] parameters are required.
  /// The [currentStep] must be greater than or equal to 0.
  const AnimationStepper({
    super.key,
    required this.steps,
    required this.currentStep,
    this.isLoading = false,
    this.onStepTapped,
    this.theme = const AnimationStepperTheme(),
    this.enableStepTapping = true,
  }) : assert(currentStep >= 0);

  @override
  State<AnimationStepper> createState() => _AnimationStepperState();
}

/// Private state class for [AnimationStepper].
///
/// Manages animation controllers and tracks step transitions.
class _AnimationStepperState extends State<AnimationStepper>
    with SingleTickerProviderStateMixin {
  /// Animation controller for step transitions.
  late AnimationController _controller;

  /// Curved animation for smooth step transitions.
  late Animation<double> _animation;

  /// Previous step index used to determine animation direction.
  int _previousStep = 0;

  @override
  void initState() {
    super.initState();
    _previousStep = widget.currentStep;
    _controller = AnimationController(
      duration: widget.theme.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.theme.animationCurve,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimationStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentStep != widget.currentStep) {
      _previousStep = oldWidget.currentStep;
      _controller.reset();
      _controller.forward();
    }
    if (oldWidget.theme.animationDuration != widget.theme.animationDuration) {
      _controller.duration = widget.theme.animationDuration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: widget.theme.connectedLine
                ? _buildConnectedLayout()
                : _buildSeparatedLayout(),
          ),
        );
      },
    );
  }

  /// Builds the stepper with connected layout mode.
  ///
  /// In this mode, lines connect directly to step circles with no gap.
  /// Uses Stack-based positioning for precise line alignment.
  Widget _buildConnectedLayout() {
    final totalWidth =
        (widget.steps.length - 1) * widget.theme.stepSpacing + widget.theme.stepSize;

    return SizedBox(
      width: totalWidth,
      child: Stack(
        children: [
          // Background lines layer
          Positioned(
            top: (widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2) / 2 - widget.theme.lineThickness / 2,
            left: (widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2) / 2,
            right: (widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2) / 2,
            child: Row(
              children: List.generate(
                widget.steps.length - 1,
                (i) => Expanded(child: _buildConnectingLine(i)),
              ),
            ),
          ),
          // Steps layer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(widget.steps.length, (i) => _buildStep(i)),
          ),
        ],
      ),
    );
  }

  /// Builds the stepper with separated layout mode.
  ///
  /// In this mode, there is a visual gap between step circles and lines.
  /// Uses two-layer Row layout with aligned spacing.
  Widget _buildSeparatedLayout() {
    return Stack(
      children: [
        // Lines layer (drawn first, appears behind)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildLinesForSeparatedLayout(),
        ),
        // Steps layer (drawn second, appears on top)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildStepsForSeparatedLayout(),
        ),
      ],
    );
  }

  /// Builds the line layer for separated layout mode.
  ///
  /// Creates a row of spacers and connecting lines positioned behind steps.
  List<Widget> _buildLinesForSeparatedLayout() {
    final List<Widget> children = [];

    for (int i = 0; i < widget.steps.length; i++) {
      // Add transparent spacer for step
      children.add(SizedBox(
        width: widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2,
      ));

      // Add connecting line (except after last step)
      if (i < widget.steps.length - 1) {
        children.add(SizedBox(
          width: widget.theme.stepSpacing,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.theme.lineHorizontalPadding,
            ),
            child: _buildConnectingLine(i),
          ),
        ));
      }
    }

    return children;
  }

  /// Builds the step layer for separated layout mode.
  ///
  /// Creates a row of steps with fixed widths to align with the line layer.
  List<Widget> _buildStepsForSeparatedLayout() {
    final List<Widget> children = [];
    final stepWidth = widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2;

    for (int i = 0; i < widget.steps.length; i++) {
      // Add step with fixed width to match lines layer
      children.add(
        SizedBox(
          width: stepWidth,
          child: _buildStep(i),
        ),
      );

      // Add spacer for line (except after last step)
      if (i < widget.steps.length - 1) {
        children.add(SizedBox(width: widget.theme.stepSpacing));
      }
    }

    return children;
  }


  /// Builds a single step widget at the given [index].
  ///
  /// Determines the step's state (active, completed, or inactive) and
  /// applies appropriate colors and styles. Includes the step circle,
  /// icon, title, subtitle, and optional loading indicator.
  Widget _buildStep(int index) {
    final step = widget.steps[index];
    final isActive = index == widget.currentStep;
    final isCompleted = index < widget.currentStep;
    final isLoadingThisStep = isActive && widget.isLoading;

    Color stepColor;
    TextStyle? titleStyle;

    if (isCompleted) {
      stepColor = widget.theme.completedColor;
      titleStyle =
          widget.theme.completedTitleStyle ??
          TextStyle(
            color: widget.theme.completedColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          );
    } else if (isActive) {
      stepColor = widget.theme.activeColor;
      titleStyle =
          widget.theme.activeTitleStyle ??
          TextStyle(
            color: widget.theme.activeColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          );
    } else {
      stepColor = widget.theme.inactiveColor;
      titleStyle =
          widget.theme.inactiveTitleStyle ??
          TextStyle(color: widget.theme.inactiveColor, fontSize: 12);
    }

    final subtitleStyle =
        widget.theme.subtitleStyle ??
        TextStyle(color: Colors.grey[600], fontSize: 10);

    return GestureDetector(
      onTap: widget.enableStepTapping && !isLoadingThisStep
          ? () => widget.onStepTapped?.call(index)
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Fixed size container to prevent height jumping when loading indicator appears
          SizedBox(
            width: widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2,
            height: widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer loading indicator with fade animation
                AnimatedOpacity(
                  opacity: isLoadingThisStep ? 1.0 : 0.0,
                  duration: widget.theme.animationDuration,
                  curve: widget.theme.animationCurve,
                  child: SizedBox(
                    width: widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2,
                    height: widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2,
                    child: CircularProgressIndicator(
                      strokeWidth: widget.theme.loadingIndicatorStrokeWidth,
                      valueColor: AlwaysStoppedAnimation<Color>(stepColor),
                    ),
                  ),
                ),
                // Step circle
                AnimatedContainer(
                  duration: widget.theme.animationDuration,
                  curve: widget.theme.animationCurve,
                  width: widget.theme.stepSize,
                  height: widget.theme.stepSize,
                  decoration: BoxDecoration(
                    color: stepColor,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(widget.theme.stepIconPadding),
                  child: FittedBox(
                    child: IconTheme(
                      data: IconThemeData(
                        color: Colors.white,
                        size:
                            widget.theme.stepSize -
                            widget.theme.stepIconPadding * 2,
                      ),
                      child: DefaultTextStyle(
                        style: const TextStyle(color: Colors.white),
                        child: step.icon,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (step.title != null) ...[
            SizedBox(height: widget.theme.stepTextSpacing),
            Text(step.title!, style: titleStyle, textAlign: TextAlign.center),
          ],
          if (step.subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              step.subtitle!,
              style: subtitleStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  /// Builds the connecting line between steps at the given [index].
  ///
  /// The line animates its fill progress when transitioning between steps.
  /// Lines before the current step are filled, others show only the background.
  ///
  /// The [index] parameter represents the line after step [index].
  Widget _buildConnectingLine(int index) {
    // The line is active if the next step is completed or currently active
    final isLineActive = index < widget.currentStep;
    final isAnimating =
        (index == widget.currentStep - 1 &&
            _previousStep < widget.currentStep) ||
        (index == widget.currentStep && _previousStep > widget.currentStep);

    final lineContent = AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double progress = 1.0;

        if (isAnimating) {
          if (index == widget.currentStep - 1 &&
              _previousStep < widget.currentStep) {
            // Moving forward: animate the line filling up
            progress = _animation.value;
          } else if (index == widget.currentStep &&
              _previousStep > widget.currentStep) {
            // Moving backward: animate the line emptying
            progress = 1.0 - _animation.value;
          }
        } else {
          progress = isLineActive ? 1.0 : 0.0;
        }

        return Stack(
          children: [
            // Background line (inactive)
            Container(
              height: widget.theme.lineThickness,
              color: widget.theme.lineColor,
            ),
            // Foreground line (active) - animated
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: widget.theme.lineThickness,
                color: widget.theme.activeLineColor,
              ),
            ),
          ],
        );
      },
    );

    // For connected layout, the line is already positioned by parent Stack
    if (widget.theme.connectedLine) {
      return lineContent;
    }

    // For separated layout, add padding only (width is controlled by parent)
    return Padding(
      padding: EdgeInsets.only(
        top: (widget.theme.stepSize + widget.theme.loadingIndicatorStrokeWidth * 2) / 2 - widget.theme.lineThickness / 2,
      ),
      child: lineContent,
    );
  }
}
