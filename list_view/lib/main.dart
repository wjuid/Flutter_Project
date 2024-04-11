import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 207, 112, 171)),
        cardTheme: const CardTheme(color: Colors.yellowAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic LIst'),
        ),
        body: const LongList(),
      ),
    );
  }
}

class ListView_01 extends StatelessWidget {
  const ListView_01({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text('photo'),
        )
      ],
    );
  }
}

class ListView_02 extends StatelessWidget {
  const ListView_02({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 160,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.green,
          ),
          Container(
            width: 160,
            color: Colors.grey,
          ),
          Container(
            width: 160,
            color: Colors.red,
          ),
          Container(
            width: 160,
            color: Colors.yellow,
          ),
          Container(
            width: 160,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class GridView_01 extends StatelessWidget {
  const GridView_01({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(100, (index) {
        return Center(
            child: Container(
          padding: const EdgeInsets.all(8),
          width: 100,
          height: 100,
          color: Colors.blue,
          child: Text('$index'),
        ));
      }),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(sender);
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return Text(body);
  }
}

class MixedList extends StatelessWidget {
  final List<ListItem> items = List.generate(100, (index) {
    return index % 6 == 0
        ? HeadingItem('Heading $index')
        : MessageItem('Sender $index', 'Message body $index');
  });

  MixedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildSubtitle(context),
        );
      },
    );
  }
}

class SpacedItemList extends StatelessWidget {
  const SpacedItemList({super.key});
  @override
  Widget build(BuildContext context) {
    const items = 15;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              items,
              (index) => ItemWidget(text: 'Item $index'),
            ),
          ),
        ));
      },
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}

class LongList extends StatelessWidget {
  const LongList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10000, (index) => 'Item $index');
    return ListView.builder(
      itemCount: items.length,
      prototypeItem: ListTile(
        title: Text(items.first),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}
