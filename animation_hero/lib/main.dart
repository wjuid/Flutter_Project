import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({required this.name, required this.age, required this.emoji});
}

const people = [
  Person(name: 'John', age: 20, emoji: '🙋🏻‍♂️'),
  Person(name: 'Jane', age: 21, emoji: '👸🏽'),
  Person(name: 'Jack', age: 22, emoji: '🧔🏿‍♂️'),
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('People'),
        ),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return DetailsPage(person: person);
                  },
                ));
              },
              leading: Hero(
                tag: person.name,
                child: Text(
                  person.emoji,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              title: Text(person.name),
              subtitle: Text('${person.age} years'),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          },
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Person person;
  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
            tag: person.name,
            child: Text(
              person.emoji,
              style: const TextStyle(fontSize: 40),
            )),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              person.name,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${person.age} years old',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
