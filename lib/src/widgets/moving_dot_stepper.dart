import 'package:flutter/material.dart';

import '../models/moving_dot_stepper_theme.dart';

/// A horizontal stepper widget with a moving dot indicator that transitions between steps.
///
/// [MovingDotStepper] displays a sequence of steps with three states:
/// - Completed: Shows a checkmark icon (customizable)
/// - Active: Shows a filled circle
/// - Inactive: Shows an empty circle (border only)
///
/// When the current step changes, the widget animates:
/// - The active dot fades to a checkmark
/// - The connecting line fills to the next step
/// - The next inactive dot becomes active
///
/// ## Basic Usage
///
/// ```dart
/// MovingDotStepper(
///   stepCount: 4,
///   currentStep: 1,
///   stepLabels: ['Start', 'Process', 'Review', 'Complete'],
///   onStepTapped: (index) {
///     setState(() => currentStep = index);
///   },
/// )
/// ```
///
/// ## Custom Completed Icon
///
/// ```dart
/// MovingDotStepper(
///   stepCount: 3,
///   currentStep: 0,
///   completedIcon: Icon(Icons.star),
/// )
/// ```
///
/// ## Custom Theme
///
/// ```dart
/// MovingDotStepper(
///   stepCount: 4,
///   currentStep: 1,
///   theme: MovingDotStepperTheme(
///     activeColor: Colors.purple,
///     completedColor: Colors.deepPurple,
///     dotSize: 28.0,
///     animationDuration: Duration(milliseconds: 500),
///   ),
/// )
/// ```
class MovingDotStepper extends StatefulWidget {
  /// The total number of steps in the stepper.
  ///
  /// Must be greater than 0.
  final int stepCount;

  /// The index of the currently active step (0-based).
  ///
  /// Must be between 0 and [stepCount] - 1.
  /// Steps before this index are marked as completed, and steps after are inactive.
  final int currentStep;

  /// Optional labels for each step.
  ///
  /// If provided, the list length must match [stepCount].
  /// Labels are displayed below each step dot.
  final List<String>? stepLabels;

  /// The icon to display for completed steps.
  ///
  /// If null, defaults to [Icons.check].
  final Widget? completedIcon;

  /// The icon to display for the active (current) step.
  ///
  /// If null, shows a filled circle without an icon.
  final Widget? activeIcon;

  /// The icon to display for inactive (upcoming) steps.
  ///
  /// If null, shows an empty circle without an icon.
  final Widget? inactiveIcon;

  /// Called when a step is tapped by the user.
  ///
  /// The callback receives the index of the tapped step.
  /// Only triggered if [enableStepTapping] is `true`.
  final ValueChanged<int>? onStepTapped;

  /// Whether steps can be tapped to trigger [onStepTapped].
  ///
  /// Defaults to `true`.
  final bool enableStepTapping;

  /// The theme configuration for customizing the stepper's appearance.
  ///
  /// Controls colors, sizes, spacing, and animations.
  ///
  /// Defaults to [MovingDotStepperTheme()] with Material Design default values.
  final MovingDotStepperTheme theme;

  /// Creates a [MovingDotStepper].
  ///
  /// The [stepCount] and [currentStep] parameters are required.
  const MovingDotStepper({
    super.key,
    required this.stepCount,
    required this.currentStep,
    this.stepLabels,
    this.completedIcon,
    this.activeIcon,
    this.inactiveIcon,
    this.onStepTapped,
    this.enableStepTapping = true,
    this.theme = const MovingDotStepperTheme(),
  })  : assert(stepCount > 0, 'stepCount must be greater than 0'),
        assert(currentStep >= 0, 'currentStep must be >= 0'),
        assert(currentStep < stepCount, 'currentStep must be < stepCount'),
        assert(
          stepLabels == null || stepLabels.length == stepCount,
          'stepLabels length must match stepCount',
        );

  @override
  State<MovingDotStepper> createState() => _MovingDotStepperState();
}

class _MovingDotStepperState extends State<MovingDotStepper>
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
    _controller.value = 1.0; // Start completed
  }

  @override
  void didUpdateWidget(MovingDotStepper oldWidget) {
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: _buildStepper(),
      ),
    );
  }

  /// Builds the stepper with independent line segments (○━━○━━○).
  Widget _buildStepper() {
    final List<Widget> children = [];

    for (int i = 0; i < widget.stepCount; i++) {
      // Add step with fixed width wrapper
      children.add(
        SizedBox(
          width: widget.theme.dotSize,
          child: _buildStep(i),
        ),
      );

      // Add line (except after last step)
      if (i < widget.stepCount - 1) {
        children.add(SizedBox(width: widget.theme.linePadding));
        children.add(
          SizedBox(
            width: widget.theme.stepSpacing -
                widget.theme.dotSize -
                widget.theme.linePadding * 2,
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.theme.dotSize / 2 - widget.theme.lineThickness / 2,
              ),
              child: _buildConnectingLine(i),
            ),
          ),
        );
        children.add(SizedBox(width: widget.theme.linePadding));
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  /// Builds a single step dot at the given [index].
  Widget _buildStep(int index) {
    final isActive = index == widget.currentStep;
    final isCompleted = index < widget.currentStep;
    final isInactive = index > widget.currentStep;

    return GestureDetector(
      onTap: widget.enableStepTapping
          ? () => widget.onStepTapped?.call(index)
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widget.theme.dotSize,
            height: widget.theme.dotSize,
            child: _buildDot(index, isActive, isCompleted, isInactive),
          ),
          if (widget.stepLabels != null) ...[
            SizedBox(height: widget.theme.labelSpacing),
            Text(
              widget.stepLabels![index],
              style: _getLabelStyle(isActive, isCompleted, isInactive),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  /// Builds the dot indicator for a step based on its state.
  Widget _buildDot(
      int index, bool isActive, bool isCompleted, bool isInactive) {
    // Forward animations (currentStep increased)
    final isAnimatingToCompleted = index == _previousStep &&
        widget.currentStep > _previousStep &&
        index < widget.currentStep;

    final isAnimatingToActive =
        index == widget.currentStep && widget.currentStep > _previousStep;

    // Backward animations (currentStep decreased)
    final isAnimatingFromActive = index == _previousStep &&
        widget.currentStep < _previousStep &&
        index > widget.currentStep;

    final isAnimatingFromCompleted =
        index == widget.currentStep && widget.currentStep < _previousStep;

    // Forward: Active → Completed
    if (isAnimatingToCompleted) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 1.0 - _animation.value,
                child: _buildActiveDot(),
              ),
              Opacity(
                opacity: _animation.value,
                child: _buildCompletedDot(),
              ),
            ],
          );
        },
      );
    }

    // Forward: Inactive → Active
    if (isAnimatingToActive) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 1.0 - _animation.value,
                child: _buildInactiveDot(),
              ),
              Opacity(
                opacity: _animation.value,
                child: _buildActiveDot(),
              ),
            ],
          );
        },
      );
    }

    // Backward: Active → Inactive
    if (isAnimatingFromActive) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 1.0 - _animation.value,
                child: _buildActiveDot(),
              ),
              Opacity(
                opacity: _animation.value,
                child: _buildInactiveDot(),
              ),
            ],
          );
        },
      );
    }

    // Backward: Completed → Active
    if (isAnimatingFromCompleted) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 1.0 - _animation.value,
                child: _buildCompletedDot(),
              ),
              Opacity(
                opacity: _animation.value,
                child: _buildActiveDot(),
              ),
            ],
          );
        },
      );
    }

    // Static states
    if (isCompleted) {
      return _buildCompletedDot();
    } else if (isActive) {
      return _buildActiveDot();
    } else {
      return _buildInactiveDot();
    }
  }

  /// Builds a completed step dot (with checkmark icon).
  Widget _buildCompletedDot() {
    return Container(
      width: widget.theme.dotSize,
      height: widget.theme.dotSize,
      decoration: BoxDecoration(
        color: widget.theme.completedColor,
        shape: BoxShape.circle,
        boxShadow: widget.theme.dotShadow,
      ),
      child: Center(
        child: widget.completedIcon ??
            Icon(
              Icons.check,
              size: widget.theme.iconSize,
              color: Colors.white,
            ),
      ),
    );
  }

  /// Builds an active step dot (filled or outlined circle).
  Widget _buildActiveDot() {
    return Container(
      width: widget.theme.dotSize,
      height: widget.theme.dotSize,
      decoration: BoxDecoration(
        color: widget.theme.activeFillColor ?? widget.theme.activeColor,
        shape: BoxShape.circle,
        border: widget.theme.activeBorderColor != null
            ? Border.all(
                color: widget.theme.activeBorderColor!,
                width: widget.theme.activeBorderWidth,
              )
            : null,
        boxShadow: widget.theme.dotShadow,
      ),
      child:
          widget.activeIcon != null ? Center(child: widget.activeIcon!) : null,
    );
  }

  /// Builds an inactive step dot (empty circle with border).
  Widget _buildInactiveDot() {
    return Container(
      width: widget.theme.dotSize,
      height: widget.theme.dotSize,
      decoration: BoxDecoration(
        color: widget.theme.inactiveFillColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.theme.inactiveColor,
          width: widget.theme.inactiveBorderWidth,
        ),
        boxShadow: widget.theme.dotShadow,
      ),
      child: widget.inactiveIcon != null
          ? Center(child: widget.inactiveIcon!)
          : null,
    );
  }

  /// Builds the connecting line between steps at the given [index].
  Widget _buildConnectingLine(int index) {
    final isLineActive = index < widget.currentStep;
    final isAnimating = (index == widget.currentStep - 1 &&
            _previousStep < widget.currentStep) ||
        (index == widget.currentStep && _previousStep > widget.currentStep);

    return AnimatedBuilder(
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
  }

  /// Gets the appropriate text style for a step label based on its state.
  TextStyle _getLabelStyle(bool isActive, bool isCompleted, bool isInactive) {
    if (isCompleted) {
      return widget.theme.completedLabelStyle ??
          TextStyle(
            color: widget.theme.completedColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          );
    } else if (isActive) {
      return widget.theme.activeLabelStyle ??
          TextStyle(
            color: widget.theme.activeColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          );
    } else {
      return widget.theme.inactiveLabelStyle ??
          TextStyle(
            color: widget.theme.inactiveColor,
            fontSize: 12,
          );
    }
  }
}
