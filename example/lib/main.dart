import 'package:flutter/material.dart';
import 'package:flutter_animation_stepper/flutter_animation_stepper.dart';

void main() {
  runApp(const MyApp());
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

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int _currentStep = 0;
  int? _loadingStep;

  final List<StepItem> _steps = [
    StepItem(
      icon: const Icon(Icons.shopping_cart),
      title: 'Cart',
      subtitle: 'Add items',
    ),
    StepItem(
      icon: const Icon(Icons.payment),
      title: 'Payment',
      subtitle: 'Choose method',
    ),
    StepItem(
      icon: const Icon(Icons.local_shipping),
      title: 'Delivery',
      subtitle: 'Enter address',
    ),
    StepItem(
      icon: const Icon(Icons.check_circle),
      title: 'Complete',
      subtitle: 'Order placed',
    ),
  ];

  Future<void> _nextStep() async {
    if (_currentStep < _steps.length - 1) {
      // Show loading on current step
      setState(() {
        _loadingStep = _currentStep;
      });

      // Simulate async operation (e.g., API call, validation)
      await Future.delayed(const Duration(seconds: 2));

      // Move to next step and clear loading
      setState(() {
        _currentStep++;
        _loadingStep = null;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Stepper Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
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
              steps: _steps,
              currentStep: _currentStep,
              loadingStep: _loadingStep,
              onStepTapped: (index) {
                setState(() {
                  _currentStep = index;
                });
              },
            ),
            const SizedBox(height: 48),
            const Text(
              'Custom Theme',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            AnimationStepper(
              steps: _steps,
              currentStep: _currentStep,
              loadingStep: _loadingStep,
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
              onStepTapped: (index) {
                setState(() {
                  _currentStep = index;
                });
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _currentStep > 0 && _loadingStep == null ? _previousStep : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                ),
                Text(
                  'Step ${_currentStep + 1} of ${_steps.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _currentStep < _steps.length - 1 && _loadingStep == null
                      ? _nextStep
                      : null,
                  icon: _loadingStep != null
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
          ],
        ),
      ),
    );
  }
}
