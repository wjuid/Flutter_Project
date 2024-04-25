import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade100)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DraggableScrollableSheet Sample'),
        ),
        body: const DraggableScrollableSheetExample(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DraggableScrollableSheetExample extends StatefulWidget {
  const DraggableScrollableSheetExample({super.key});
  @override
  State<DraggableScrollableSheetExample> createState() =>
      _DraggableScrollableSheetExample();
}

class _DraggableScrollableSheetExample
    extends State<DraggableScrollableSheetExample> {
  double _sheetPosition = 0.5;
  final double _dragSensitivity = 600;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DraggableScrollableSheet(
      initialChildSize: _sheetPosition,
      builder: (context, scrollController) {
        return ColoredBox(
          color: colorScheme.inversePrimary,
          child: Column(
            children: [
              Grabber(
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _sheetPosition -= details.delta.dy / _dragSensitivity;
                      if (_sheetPosition < 0.25) {
                        _sheetPosition = 0.25;
                      }
                      if (_sheetPosition > 1.0) {
                        _sheetPosition = 1.0;
                      }
                    });
                  },
                  isOnDesktopAndWeb: _isOnDesktopAndWeb),
              Flexible(
                child: ListView.builder(
                  controller: _isOnDesktopAndWeb ? null : scrollController,
                  itemCount: 46,
                  itemBuilder: (context, index) {
                    if (index < 47) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 200,
                          child: Image(
                            image:
                                AssetImage('assets/images/(${index + 1}).jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}

class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
    required this.isOnDesktopAndWeb,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final bool isOnDesktopAndWeb;
  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: colorScheme.onSurface,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
