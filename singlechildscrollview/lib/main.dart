import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SingleChildScrollViewExample(),
    );
  }
}

class SingleChildScrollViewExample extends StatelessWidget {
  const SingleChildScrollViewExample({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: const Color(0xffeeee00),
                      height: 120.0,
                      alignment: Alignment.center,
                      child: const Text('Fixed Height Content'),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xff008000),
                        height: 120.0,
                        alignment: Alignment.center,
                        child: const Text('Fixed Height Content'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
