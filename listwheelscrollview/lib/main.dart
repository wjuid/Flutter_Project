import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.amberAccent,
        child: ListWheelScrollView(
          // perspective: 0.001,
          //offAxisFraction: -0.5,
          squeeze: 1,
          itemExtent: 100,
          diameterRatio: 1.5,
          offAxisFraction: 0.5,
          useMagnifier: true,
          magnification: 1.5,
          children: List.generate(
              46,
              (index) => SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.asset(
                    'assets/images/(${index + 1}).jpg',
                    fit: BoxFit.cover,
                  ))).toList(),
        ),
      ),
    );
  }
}
