import 'package:flutter/material.dart';

enum ListDemoType {
  oneline,
  twoline,
}

class ListDemo extends StatelessWidget {
  const ListDemo({super.key, required this.type});

  final ListDemoType type;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('List demo'),
        ),
        body: ListView(
          restorationId: 'list demo list view',
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (var index = 1; index < 21; index++)
              ListTile(
                leading: ExcludeSemantics(
                    child: CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/pic.png'),
                  foregroundColor: Colors.white,
                  radius: 25,
                  child: Text(
                    '$index',
                    style: const TextStyle(fontSize: 20),
                  ),
                )),
                title: Text('Item $index'),
                subtitle: type == ListDemoType.twoline
                    ? const Text('Secondary text')
                    : null,
                trailing: const Icon(Icons.done),
              )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const ListDemo(type: ListDemoType.twoline));
}
