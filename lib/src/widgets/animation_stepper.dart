import 'package:flutter/material.dart';
import '../models/step_item.dart';
import '../models/animation_stepper_theme.dart';

/// A horizontal stepper widget with smooth animations between steps
class AnimationStepper extends StatefulWidget {
  /// List of steps to display
  final List<StepItem> steps;

  /// Current active step index (0-based)
  final int currentStep;

  /// Callback when a step is tapped
  final ValueChanged<int>? onStepTapped;

  /// Theme configuration for the stepper
  final AnimationStepperTheme theme;

  /// Whether steps can be tapped to navigate
  final bool enableStepTapping;

  const AnimationStepper({
    Key? key,
    required this.steps,
    required this.currentStep,
    this.onStepTapped,
    this.theme = const AnimationStepperTheme(),
    this.enableStepTapping = true,
  })  : assert(currentStep >= 0),
        super(key: key);

  @override
  State<AnimationStepper> createState() => _AnimationStepperState();
}

class _AnimationStepperState extends State<AnimationStepper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildSteps(),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildSteps() {
    final List<Widget> children = [];

    for (int i = 0; i < widget.steps.length; i++) {
      // Add step
      children.add(_buildStep(i));

      // Add connecting line (except after last step)
      if (i < widget.steps.length - 1) {
        children.add(_buildConnectingLine(i));
      }
    }

    return children;
  }

  Widget _buildStep(int index) {
    final step = widget.steps[index];
    final isActive = index == widget.currentStep;
    final isCompleted = index < widget.currentStep;

    Color stepColor;
    TextStyle? titleStyle;

    if (isCompleted) {
      stepColor = widget.theme.completedColor;
      titleStyle = widget.theme.completedTitleStyle ??
          TextStyle(
            color: widget.theme.completedColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          );
    } else if (isActive) {
      stepColor = widget.theme.activeColor;
      titleStyle = widget.theme.activeTitleStyle ??
          TextStyle(
            color: widget.theme.activeColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          );
    } else {
      stepColor = widget.theme.inactiveColor;
      titleStyle = widget.theme.inactiveTitleStyle ??
          TextStyle(
            color: widget.theme.inactiveColor,
            fontSize: 12,
          );
    }

    final subtitleStyle = widget.theme.subtitleStyle ??
        TextStyle(
          color: Colors.grey[600],
          fontSize: 10,
        );

    return GestureDetector(
      onTap: widget.enableStepTapping
          ? () => widget.onStepTapped?.call(index)
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                  size: widget.theme.stepSize - widget.theme.stepIconPadding * 2,
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(color: Colors.white),
                  child: step.icon,
                ),
              ),
            ),
          ),
          if (step.title != null) ...[
            SizedBox(height: widget.theme.stepTextSpacing),
            Text(
              step.title!,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
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

  Widget _buildConnectingLine(int index) {
    // The line is active if the next step is completed or currently active
    final isLineActive = index < widget.currentStep;
    final isAnimating = (index == widget.currentStep - 1 && _previousStep < widget.currentStep) ||
        (index == widget.currentStep && _previousStep > widget.currentStep);

    return Padding(
      padding: EdgeInsets.only(
        top: widget.theme.stepSize / 2 - widget.theme.lineThickness / 2,
      ),
      child: SizedBox(
        width: 50, // Fixed width for connecting line
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double progress = 1.0;

            if (isAnimating) {
              if (index == widget.currentStep - 1 && _previousStep < widget.currentStep) {
                // Moving forward: animate the line filling up
                progress = _animation.value;
              } else if (index == widget.currentStep && _previousStep > widget.currentStep) {
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
        ),
      ),
    );
  }
}
