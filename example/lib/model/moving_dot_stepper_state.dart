class MovingDotStepperState {
  final int currentStep;
  final int stepCount;

  const MovingDotStepperState({
    required this.currentStep,
    required this.stepCount,
  });

  MovingDotStepperState copyWith({
    int? currentStep,
    int? stepCount,
  }) {
    return MovingDotStepperState(
      currentStep: currentStep ?? this.currentStep,
      stepCount: stepCount ?? this.stepCount,
    );
  }
}
