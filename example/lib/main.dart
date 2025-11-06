import 'package:flutter/material.dart';
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'stepper_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Stepper Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends ConsumerWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepperState = ref.watch(stepperControllerProvider);
    final controller = ref.read(stepperControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Stepper Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text(
              'Default Theme',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            AnimationStepper(
              steps: stepperState.steps,
              currentStep: stepperState.currentStep,
              isLoading: stepperState.isLoading,
              onStepTapped: controller.goToStep,
            ),
            const SizedBox(height: 48),
            const Text(
              'Custom Theme',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            AnimationStepper(
              steps: stepperState.steps,
              currentStep: stepperState.currentStep,
              isLoading: stepperState.isLoading,
              theme: AnimationStepperTheme(
                activeColor: Colors.purple,
                completedColor: Colors.green,
                inactiveColor: Colors.grey.shade300,
                activeLineColor: Colors.purple,
                lineColor: Colors.grey.shade300,
                stepSize: 50,
                lineThickness: 3,
                animationDuration: const Duration(milliseconds: 500),
                animationCurve: Curves.easeInOutCubic,
                activeTitleStyle: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onStepTapped: controller.goToStep,
            ),
            const SizedBox(height: 48),
            const Text(
              'Connected Line Style',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            AnimationStepper(
              steps: stepperState.steps,
              currentStep: stepperState.currentStep,
              isLoading: stepperState.isLoading,
              theme: const AnimationStepperTheme(
                connectedLine: true,
                activeColor: Color(0xFFFF6B6B),
                completedColor: Color(0xFF4ECDC4),
                inactiveColor: Color(0xFFE0E0E0),
                activeLineColor: Color(0xFFFF6B6B),
                lineColor: Color(0xFFE0E0E0),
                lineThickness: 4,
              ),
              onStepTapped: controller.goToStep,
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: stepperState.currentStep > 0 && !stepperState.isLoading
                      ? controller.previousStep
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                ),
                Text(
                  'Step ${stepperState.currentStep + 1} of ${stepperState.steps.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: stepperState.currentStep < stepperState.steps.length - 1 &&
                          !stepperState.isLoading
                      ? controller.nextStep
                      : null,
                  icon: stepperState.isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      ),
    );
  }
}
