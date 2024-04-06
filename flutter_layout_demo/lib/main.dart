import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
            centerTitle: true,
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                ImageSection(image: 'assets/images/pic.jpg'),
                TitleSection(
                    name: 'Oeschinen lake Compground',
                    location: 'Kandersteg, Switzerland'),
                ButtonSection(),
                TextSection(
                    description:
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Bernese Alps. Situated 1,578 meters above sea level, it '
                        'is one of the larger Alpine Lakes. A gondola ride from '
                        'Kandersteg, followed by a half-hour walk through pastures '
                        'and pine forest, leads you to the lake, which warms to 20 '
                        'degrees Celsius in the summer. Activities enjoyed here '
                        'include rowing, and riding the summer toboggan run.'
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the '),
              ],
            ),
          )),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});
  final String name;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          BottonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          BottonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          )
        ],
      ),
    );
  }
}

class BottonWithText extends StatelessWidget {
  const BottonWithText(
      {super.key,
      required this.color,
      required this.icon,
      required this.label});
  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}
