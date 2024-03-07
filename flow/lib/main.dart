import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CounterIncrementor(onPressed: _increment),
        const SizedBox(width: 6),
        CounterDisplay(count: _counter),
      ],
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, super.key});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text("Increment"));
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, super.key});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Text("Count: $count");
  }
}
