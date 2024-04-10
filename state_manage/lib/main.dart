import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class TapboxA extends StatefulWidget {
  const TapboxA({super.key});
  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
    debugPrint('onTap');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapUp: (details) {
        debugPrint(
            'onTapup----${details.globalPosition}------${details.localPosition}');
      },
      onTapDown: (details) {
        debugPrint(
            'onTapDown----${details.globalPosition}------${details.localPosition}');
      },
      onTapCancel: () {
        debugPrint('onTapCancel');
      },
      onDoubleTap: () {
        debugPrint('onDoubleTap');
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter demo"),
        ),
        body: const Center(
          child: TapboxA(),
        ),
      ),
    );
  }
}
