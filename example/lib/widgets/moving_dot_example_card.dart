import 'package:flutter/material.dart';
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/example_data.dart';
import '../provider/moving_dot_stepper_controller.dart';

class MovingDotExampleCard extends ConsumerWidget {
  final String exampleId;
  final MovingDotExampleData example;

  const MovingDotExampleCard({
    super.key,
    required this.exampleId,
    required this.example,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepperState = ref.watch(
      movingDotStepperControllerProvider(exampleId, example.stepCount),
    );
    final controller = ref.read(
      movingDotStepperControllerProvider(exampleId, example.stepCount).notifier,
    );

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and description
            Text(
              example.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (example.description != null) ...[
              const SizedBox(height: 4),
              Text(
                example.description!,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
            const SizedBox(height: 24),

            // Stepper
            MovingDotStepper(
              stepCount: example.stepCount,
              currentStep: stepperState.currentStep,
              stepLabels: example.stepLabels,
              completedIcon: example.completedIcon,
              activeIcon: example.activeIcon,
              inactiveIcon: example.inactiveIcon,
              theme: example.theme ?? const MovingDotStepperTheme(),
              onStepTapped: controller.goToStep,
            ),

            const SizedBox(height: 24),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: stepperState.currentStep > 0
                      ? controller.previousStep
                      : null,
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: const Text('Previous'),
                ),
                Text(
                  'Step ${stepperState.currentStep + 1} of ${stepperState.stepCount}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed:
                      stepperState.currentStep < stepperState.stepCount - 1
                      ? controller.nextStep
                      : null,
                  icon: const Icon(Icons.arrow_forward, size: 18),
                  label: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
