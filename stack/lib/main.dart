import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Stack Widget"),
        elevation: 30,
      ),
      body: const MyBodyPage(),
    ),
  ));
}

class MyBodyPage extends StatelessWidget {
  const MyBodyPage({super.key});

  @override
  /*  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.orange,
          ),
        ),
      ],
    );
  } */
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
          Positioned(
            left: screenWidth - 100,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
          ),
          Positioned(
            left: screenWidth / 2 - 50,
            top: screenHeight / 2 - 90,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ),
          Positioned(
            top: screenHeight - 180,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
          Positioned(
            left: screenWidth - 100,
            top: screenHeight - 180,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
