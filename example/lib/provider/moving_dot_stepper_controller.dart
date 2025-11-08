import 'package:example/model/moving_dot_stepper_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'moving_dot_stepper_controller.g.dart';

@riverpod
class MovingDotStepperController extends _$MovingDotStepperController {
  @override
  MovingDotStepperState build(String exampleId, int stepCount) {
    return MovingDotStepperState(currentStep: 0, stepCount: stepCount);
  }

  void nextStep() {
    if (state.currentStep < state.stepCount - 1) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < state.stepCount) {
      state = state.copyWith(currentStep: index);
    }
  }
}
