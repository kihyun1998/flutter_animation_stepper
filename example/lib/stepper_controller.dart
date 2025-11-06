import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stepper_controller.g.dart';

@riverpod
class StepperController extends _$StepperController {
  @override
  StepperState build(String exampleId, List<StepItem> steps) {
    return StepperState(
      currentStep: 0,
      isLoading: false,
      steps: steps,
    );
  }

  Future<void> nextStep() async {
    if (state.currentStep < state.steps.length - 1) {
      // Show loading on current step
      state = state.copyWith(isLoading: true);

      // Simulate async operation (e.g., API call, validation)
      await Future.delayed(const Duration(seconds: 2));

      // Move to next step and clear loading
      state = state.copyWith(
        currentStep: state.currentStep + 1,
        isLoading: false,
      );
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < state.steps.length) {
      state = state.copyWith(currentStep: index);
    }
  }
}

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
