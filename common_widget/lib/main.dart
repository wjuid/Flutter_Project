import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(
          child: _buildImageColumn(),
        ),
      ),
    );
  }

  Widget _buildImageColumn() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(66, 214, 15, 15),
      ),
      child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ),
    );
  }

  Widget _buildDecoratedImage(int imageindex) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black38),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.all(2),
        child: Image.asset('assets/images/pic$imageindex.jpg',
            fit: BoxFit.scaleDown),
      ),
    );
  }

  Widget _buildImageRow(int imageIndex) {
    return Row(
      children: [
        _buildDecoratedImage(imageIndex),
        _buildDecoratedImage(imageIndex + 1),
      ],
    );
  }
}
