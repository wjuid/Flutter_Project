import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: SafeArea(
        child: MyScaffold(),
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text("Hello World"),
              /*  child: Material(
              color: Colors.amber,
              elevation: 10,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1.0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 16.0, color: Colors.lightBlue.shade100),
                    bottom: BorderSide(
                        width: 16.0, color: Colors.lightBlue.shade500),
                  ),
                ),
                child: const Text("Hello World"),
              ),
            ), */
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(child: title),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
