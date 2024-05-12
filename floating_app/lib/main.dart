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
          body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('floating app'),
              background: Image(
                image: AssetImage('assets/images/pic.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                      title: Text('Item $index'),
                    ),
                childCount: 1000),
          ),
        ],
      )),
    );
  }
}
