import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    bool _bigger = false;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedContainer(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: const [Colors.purple, Colors.transparent],
                    stops: [_bigger ? 0.2 : 0.5, 1.0])),
            width: 300,
            duration: const Duration(seconds: 1),
            child: RotationTransition(
                alignment: Alignment.center,
                turns: _animationController,
                child: const FlutterLogo(
                  size: 50.00,
                )),
          ),
        ),
      ),
    );
  }
}
