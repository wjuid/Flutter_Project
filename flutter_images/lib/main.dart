import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Image Widget"),
          elevation: 30,
        ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
        body: const MyBodyPage()),
  ));
}

class MyBodyPage extends StatelessWidget {
  const MyBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          'assets/images/111.png',
          height: 600,
          width: 600,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
