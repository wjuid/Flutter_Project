import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset('assets/images/pic1.jpg')),
              Expanded(child: Image.asset('assets/images/pic2.jpg')),
              Expanded(child: Image.asset('assets/images/pic2.jpg')),
              // Expanded(child: Image.asset('assets/images/pic2.jpg')),
            ],
          ),
        ),
      ),
    );
  }
}
