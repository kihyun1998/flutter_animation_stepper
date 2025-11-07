import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';

class StepperState {
  final int currentStep;
  final bool isLoading;
  final List<StepItem> steps;

  StepperState({
    required this.currentStep,
    required this.isLoading,
    required this.steps,
  });

  StepperState copyWith({
    int? currentStep,
    bool? isLoading,
    List<StepItem>? steps,
  }) {
    return StepperState(
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      steps: steps ?? this.steps,
    );
  }
}
