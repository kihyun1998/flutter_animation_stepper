import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/example_data.dart';
import 'widgets/example_card.dart';
import 'widgets/moving_dot_example_card.dart';

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

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animation Stepper Examples'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Animation Stepper'),
              Tab(text: 'Moving Dot Stepper'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Animation Stepper Examples
            ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: allExamples.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final example = allExamples[index];
                return ExampleCard(
                  key: ValueKey('example_$index'),
                  exampleId: 'example_$index',
                  example: example,
                );
              },
            ),
            // Moving Dot Stepper Examples
            ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: allMovingDotExamples.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final example = allMovingDotExamples[index];
                return MovingDotExampleCard(
                  key: ValueKey('moving_dot_example_$index'),
                  exampleId: 'moving_dot_example_$index',
                  example: example,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
