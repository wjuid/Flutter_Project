import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: NestedScrollViewDemo(),
      ),
    );
  }
}

class NestedScrollViewDemo extends StatelessWidget {
  const NestedScrollViewDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: const Text('Nested ListView'),
                centerTitle: true,
                // pinned: true,
                snap: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/pic.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          height: 150,
                        ),
                    childCount: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4)),
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const ClampingScrollPhysics(),
          itemCount: 30,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 50,
              child: Center(
                child: Text('Item $index'),
              ),
            );
          },
        ));
  }
}
