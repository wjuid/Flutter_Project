import 'package:flutter/material.dart';

const double _colorItemHeight = 48;

class _Palette {
  const _Palette({
    required this.name,
    required this.primary,
    this.accent,
    this.threshold = 900,
  });

  final String name;
  final MaterialColor primary;
  final MaterialAccentColor? accent;
  final int threshold;
}

const List<_Palette> _allPalette = [
  _Palette(
      name: 'Red',
      primary: Colors.red,
      accent: Colors.redAccent,
      threshold: 300),
  _Palette(
      name: 'Pink',
      primary: Colors.pink,
      accent: Colors.pinkAccent,
      threshold: 200),
  _Palette(
      name: 'Purple',
      primary: Colors.purple,
      accent: Colors.purpleAccent,
      threshold: 200),
  _Palette(
      name: 'Deep purple',
      primary: Colors.deepPurple,
      accent: Colors.deepPurpleAccent,
      threshold: 200),
  _Palette(
      name: 'Indigo',
      primary: Colors.indigo,
      accent: Colors.indigoAccent,
      threshold: 200),
  _Palette(
      name: 'Blue',
      primary: Colors.blue,
      accent: Colors.blueAccent,
      threshold: 400),
  _Palette(
      name: 'Light blue',
      primary: Colors.lightBlue,
      accent: Colors.lightBlueAccent,
      threshold: 500),
  _Palette(
      name: 'Cyan',
      primary: Colors.cyan,
      accent: Colors.cyanAccent,
      threshold: 600),
  _Palette(
      name: 'Teal',
      primary: Colors.teal,
      accent: Colors.tealAccent,
      threshold: 400),
  _Palette(
      name: 'Green',
      primary: Colors.green,
      accent: Colors.greenAccent,
      threshold: 500),
  _Palette(
      name: 'Light Green',
      primary: Colors.lightGreen,
      accent: Colors.greenAccent,
      threshold: 600),
  _Palette(
      name: 'Lime',
      primary: Colors.lime,
      accent: Colors.limeAccent,
      threshold: 800),
  _Palette(
    name: 'Yellow',
    primary: Colors.yellow,
    accent: Colors.yellowAccent,
  ),
  _Palette(
    name: 'Amber',
    primary: Colors.amber,
    accent: Colors.amberAccent,
  ),
  _Palette(
      name: 'Orange',
      primary: Colors.orange,
      accent: Colors.orangeAccent,
      threshold: 700),
  _Palette(
      name: 'Deep orange',
      primary: Colors.deepOrange,
      accent: Colors.deepOrangeAccent,
      threshold: 400),
  _Palette(name: 'Brown', primary: Colors.brown, threshold: 200),
  _Palette(name: 'Grey', primary: Colors.grey, threshold: 500),
  _Palette(name: 'Blue grey', primary: Colors.blueGrey, threshold: 500),
];

class _ColorItem extends StatelessWidget {
  const _ColorItem({
    required this.index,
    required this.color,
    this.prefix = '',
  });
  final int index;
  final Color color;
  final String prefix;

  String get _colorString =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Container(
        height: _colorItemHeight,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$prefix$index'),
            Flexible(child: Text(_colorString)),
          ],
        ),
      ),
    );
  }
}

class _PaletteTabView extends StatelessWidget {
  const _PaletteTabView({required this.colors});
  final _Palette colors;

  static const primaryKeys = <int>[
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900
  ];
  static const accentKeys = <int>[100, 200, 400, 700];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final whiteTextStyle = textTheme.bodyMedium!.copyWith(
      color: Colors.white,
    );
    final blackTextStyle = textTheme.bodyMedium!.copyWith(
      color: Colors.black,
    );

    return Scrollbar(
        child: ListView(
      itemExtent: _colorItemHeight,
      children: [
        for (final key in primaryKeys)
          DefaultTextStyle(
            style: key > colors.threshold ? whiteTextStyle : blackTextStyle,
            child: _ColorItem(index: key, color: colors.primary[key]!),
          ),
        if (colors.accent != null)
          for (final key in accentKeys)
            DefaultTextStyle(
              style: key > colors.threshold ? whiteTextStyle : blackTextStyle,
              child: _ColorItem(
                  index: key, color: colors.accent![key]!, prefix: 'A'),
            )
      ],
    ));
  }
}

class ColorsDemo extends StatelessWidget {
  const ColorsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const palettes = _allPalette;
    return MaterialApp(
      home: DefaultTabController(
        length: palettes.length,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('ColorsPalette'),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                for (final palette in palettes) Tab(text: palette.name),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              for (final palette in palettes) _PaletteTabView(colors: palette),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const ColorsDemo());
}
