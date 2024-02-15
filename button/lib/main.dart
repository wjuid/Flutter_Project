import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Button Widget"),
      ),
      body: const MyBodyPage(),
      bottomNavigationBar: const MyButtonNavigationBar(),
    ),
  ));
}

class MyButtonNavigationBar extends StatelessWidget {
  const MyButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 35,
      fixedColor: Colors.green,
      backgroundColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "frist page"),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "category"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
      ],
    );
  }
}

class MyBodyPage extends StatelessWidget {
  const MyBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.lightGreen,
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.search),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.green),
              overlayColor: MaterialStateProperty.all(Colors.red),
              elevation: MaterialStateProperty.all(20),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          child: const Text("EleveatedButton"),
        ),
      ],
    );
  }
}
