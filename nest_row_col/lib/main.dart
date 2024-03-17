import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: buildHomePage('Strawberry Pavlova Recipe'),
    );
  }

  Widget buildHomePage(String title) {
    const titleText = Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    const subTitle = Text(
      'Pavlova is a meringue base dessert named after the Russian ballerina'
      'Anna Pavlova .Pavlova features a crisp crust and soft, light inside, '
      'topped with fruit andd whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Gerogia',
        fontSize: 25,
      ),
    );

    const stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 95, 205, 99),
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 95, 205, 99),
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 95, 205, 99),
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 28, 46, 138),
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(193, 43, 170, 192),
        ),
      ],
    );
    final ratings = Container(
      padding: const EdgeInsets.all(20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );
    final iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.kitchen,
                    color: Colors.green[500],
                  ),
                  const Text('PREP:'),
                  const Text('25 min'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.green[500],
                  ),
                  const Text('COOK:'),
                  const Text('1 hr'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.restaurant,
                    color: Colors.green[500],
                  ),
                  const Text('FEED5:'),
                  const Text('4-6'),
                ],
              ),
            ],
          ),
        ));
    final leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    final mainImage = Image.asset(
      'assets/images/pic4.png',
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 440,
                  child: leftColumn,
                ),
                mainImage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
