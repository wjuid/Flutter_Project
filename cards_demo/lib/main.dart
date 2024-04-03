import 'package:flutter/material.dart';

enum CardType { standard, tappable, selectable }

class TravelDestination {
  const TravelDestination({
    required this.assetName,
    required this.title,
    required this.description,
    required this.city,
    required this.location,
    this.cardType = CardType.standard,
  });
  final String assetName;
  final String title;
  final String description;
  final String city;
  final String location;
  final CardType cardType;
}

const List<TravelDestination> _destinations = [
  TravelDestination(
    assetName: 'assets/images/pic1.jpg',
    title: 'Top 10 Cities to Visit in Tamil Nadu',
    description: 'Number 10',
    city: 'Thanjavur',
    location: 'Thanjavur, Tamil Nadu',
  ),
  TravelDestination(
    assetName: 'assets/images/pic2.jpg',
    title: 'Artisans of Southern India',
    description: 'Silk Spinners',
    city: 'Chettinad',
    location: 'Sivaganga, Tamil Nadu',
    cardType: CardType.tappable,
  ),
  TravelDestination(
    assetName: 'assets/images/pic3.jpg',
    title: 'Brihadisvara Temple',
    description: 'Temples',
    city: 'Thanjavur',
    location: 'Thanjavur, Tamil Nadu',
    cardType: CardType.selectable,
  ),
];

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem({
    super.key,
    required this.destination,
    this.shape,
  });
  static const double height = 360;
  final TravelDestination destination;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SectionTitle(title: 'Normal'),
            SizedBox(
              height: height,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: Semantics(
                  label: destination.title,
                  child: TraveDestinationContent(destination: destination),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TappableTravelDestinationItem extends StatelessWidget {
  const TappableTravelDestinationItem({
    super.key,
    required this.destination,
    this.shape,
  });
  static const double height = 298;
  final TravelDestination destination;
  final ShapeBorder? shape;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SectionTitle(title: 'Tappable'),
            SizedBox(
              height: height,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {},
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                  highlightColor: Colors.transparent,
                  child: Semantics(
                    label: destination.title,
                    child: TraveDestinationContent(destination: destination),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectableTravelDestinationItem extends StatelessWidget {
  const SelectableTravelDestinationItem({
    super.key,
    required this.destination,
    required this.isSelected,
    required this.onSelected,
    this.shape,
  });

  final TravelDestination destination;
  final ShapeBorder? shape;
  final bool isSelected;
  final VoidCallback onSelected;

  static const double height = 298;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final String selecteStatus = isSelected ? 'Selected' : 'Not selected';

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SectionTitle(title: 'Selectable (long press)'),
              SizedBox(
                height: height,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: shape,
                  child: InkWell(
                    onLongPress: () {
                      onSelected();
                    },
                    splashColor: colorScheme.onSurface.withOpacity(0.12),
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: [
                        Container(
                          color: isSelected
                              ? colorScheme.primary.withOpacity(0.08)
                              : Colors.transparent,
                        ),
                        Semantics(
                          label: '${destination.title}, $selecteStatus',
                          onLongPressHint: isSelected ? 'Deselect' : ' Select',
                          child:
                              TraveDestinationContent(destination: destination),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.check_circle,
                              color: isSelected
                                  ? colorScheme.primary
                                  : Colors.transparent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

class TraveDestinationContent extends StatelessWidget {
  const TraveDestinationContent({super.key, required this.destination});
  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headlineSmall!.copyWith(
      color: Colors.white,
    );
    final descriptionStyle = theme.textTheme.titleMedium!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                child: Ink.image(
                  image: AssetImage(destination.assetName),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Semantics(
                    container: true,
                    header: true,
                    child: Text(
                      destination.title,
                      style: titleStyle,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Semantics(
          container: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: DefaultTextStyle(
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: descriptionStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      destination.description,
                      style: descriptionStyle.copyWith(color: Colors.black54),
                    ),
                  ),
                  Text(destination.city),
                  Text(destination.location),
                ],
              ),
            ),
          ),
        ),
        if (destination.cardType == CardType.standard)
          Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              alignment: MainAxisAlignment.start,
              spacing: 28,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Share',
                      semanticsLabel: 'Share ${destination.title}',
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Explore',
                      semanticsLabel: 'Explore ${destination.title}',
                    ))
              ],
            ),
          )
      ],
    );
  }
}

class CardsDemo extends StatefulWidget {
  const CardsDemo({super.key});

  @override
  State<CardsDemo> createState() => _CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> with RestorationMixin {
  final RestorableBool _isSelected = RestorableBool(false);
  @override
  String get restorationId => 'cards_demo';
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_isSelected, 'is_selected');
  }

  @override
  void dispose() {
    _isSelected.dispose();
    super.dispose();
  }

  final GlobalKey _appBarKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.green[400],
          appBar: AppBar(
            key: _appBarKey,
            primary: true,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                )),
            leadingWidth: 60,
            iconTheme: const IconThemeData(color: Colors.black, opacity: 1),
            automaticallyImplyLeading: true,
            //  title: const Text('Cards'),
            title: const TabBar(
                labelColor: Color(0xff000000),
                labelStyle: TextStyle(fontSize: 20),
                unselectedLabelStyle: TextStyle(fontSize: 15),
                indicatorColor: Colors.amber,
                tabs: <Widget>[
                  Tab(text: 'PageA'),
                  Tab(text: 'PageB'),
                  Tab(text: 'PageC'),
                ]),
            /*     actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.update)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_scanner),
                tooltip: 'scan one scan',
              )
            ], */
            actionsIconTheme: const IconThemeData(
              color: Colors.black,
            ),
            toolbarOpacity: 0.8,
            centerTitle: false,
            elevation: 8,
            shadowColor: const Color.fromARGB(255, 6, 48, 121),
            shape: const RoundedRectangleBorder(
                side: BorderSide(
              color: Colors.grey,
              width: 4,
            )),
            toolbarHeight: 50,
            /*   bottom: const TabBar(
              tabs: <Widget>[
              Tab(text: 'PageA'),
              Tab(text: 'PageB'),
              Tab(
                text: 'PageC',
              )
            ]), */
          ),
          body: Scrollbar(
            radius: const Radius.circular(10),
            thickness: 8,
            child: ListView(
              restorationId: 'cards_demo_list_view',
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              scrollDirection: Axis.vertical,
              children: [
                for (final destination in _destinations)
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: switch (destination.cardType) {
                      CardType.standard =>
                        TravelDestinationItem(destination: destination),
                      CardType.tappable =>
                        TappableTravelDestinationItem(destination: destination),
                      CardType.selectable => SelectableTravelDestinationItem(
                          destination: destination,
                          isSelected: _isSelected.value,
                          onSelected: () {
                            setState(() {
                              _isSelected.value = !_isSelected.value;
                            });
                          }),
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const CardsDemo());
}
