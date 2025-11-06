import 'package:flutter/material.dart';
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../example_data.dart';
import '../stepper_controller.dart';

class ExampleCard extends ConsumerWidget {
  final String exampleId;
  final ExampleData example;

  const ExampleCard({
    super.key,
    required this.exampleId,
    required this.example,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepperState = ref.watch(
      stepperControllerProvider(exampleId, example.steps),
    );
    final controller = ref.read(
      stepperControllerProvider(exampleId, example.steps).notifier,
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
            AnimationStepper(
              steps: stepperState.steps,
              currentStep: stepperState.currentStep,
              isLoading: stepperState.isLoading,
              theme: example.theme ?? const AnimationStepperTheme(),
              onStepTapped: controller.goToStep,
            ),

            const SizedBox(height: 24),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed:
                      stepperState.currentStep > 0 && !stepperState.isLoading
                      ? controller.previousStep
                      : null,
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: const Text('Previous'),
                ),
                Text(
                  'Step ${stepperState.currentStep + 1} of ${stepperState.steps.length}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed:
                      stepperState.currentStep <
                              stepperState.steps.length - 1 &&
                          !stepperState.isLoading
                      ? controller.nextStep
                      : null,
                  icon: stepperState.isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.arrow_forward, size: 18),
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
