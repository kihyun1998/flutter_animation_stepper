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
  bool _isLoading = false;

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
        _isLoading = true;
      });

      // Simulate async operation (e.g., API call, validation)
      await Future.delayed(const Duration(seconds: 2));

      // Move to next step and clear loading
      setState(() {
        _currentStep++;
        _isLoading = false;
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
              steps: _steps,
              currentStep: _currentStep,
              isLoading: _isLoading,
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
              isLoading: _isLoading,
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
            const SizedBox(height: 48),
            const Text(
              'Connected Line Style',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            AnimationStepper(
              steps: _steps,
              currentStep: _currentStep,
              isLoading: _isLoading,
              theme: const AnimationStepperTheme(
                connectedLine: true,
                activeColor: Color(0xFFFF6B6B),
                completedColor: Color(0xFF4ECDC4),
                inactiveColor: Color(0xFFE0E0E0),
                activeLineColor: Color(0xFFFF6B6B),
                lineColor: Color(0xFFE0E0E0),
                lineThickness: 4,
              ),
              onStepTapped: (index) {
                setState(() {
                  _currentStep = index;
                });
              },
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _currentStep > 0 && !_isLoading ? _previousStep : null,
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
                  onPressed: _currentStep < _steps.length - 1 && !_isLoading
                      ? _nextStep
                      : null,
                  icon: _isLoading
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
