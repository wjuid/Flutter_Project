import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter Widget',
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          elevation: 20,
          backgroundColor: Colors.black,
          foregroundColor: Colors.green,
        ),
        body: MyBodyPage()),
  ));
}

class MyBodyPage extends StatelessWidget {
  const MyBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(200)),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.red, Colors.yellow]),
            ),
            // constraints: const BoxConstraints(maxWidth: 200),
            transform: Matrix4.rotationZ(0.8),
            transformAlignment: Alignment.center,
            child: const Text(
              'hello world',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.dashed,
                  wordSpacing: 20,
                  letterSpacing: 6,
                  fontStyle: FontStyle.italic),
            )));
  }
}
