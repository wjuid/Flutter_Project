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
      home: Scaffold(
        drawer: const Drawer(),
        body: CustomScrollView(slivers: [
          const SliverAppBar(
            title: Text("SliverAppBar Title"),
            centerTitle: true,
            floating: true,
            snap: true,
            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text("FlexibleSpaceBar title"),
              collapseMode: CollapseMode.parallax,
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }, childCount: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4)),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 20)),
          SliverPrototypeExtentList(
            delegate: SliverChildListDelegate([
              const Text("Hello World"),
              const Text(
                "Hello World",
                style: TextStyle(fontSize: 24),
              ),
              const Text("Hello World"),
            ]),
            prototypeItem: const Text(
              "",
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SliverToBoxAdapter(
            child: Placeholder(),
          ),
          SliverFillViewport(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.green,
              ),
            ]),
          ),
          const SliverOpacity(
            opacity: 0.7,
            sliver: SliverToBoxAdapter(
              child: FlutterLogo(
                size: 300,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
                maxHeight: 80, minHeight: 50, child: buildHeader(1)),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              }, childCount: 6),
              itemExtent: 50),

          //buildHeader(2),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate.fixeHeight(
              height: 50,
              child: buildHeader(2),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 20)),
        ]),
      ),
    );
  }
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);
  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  SliverHeaderDelegate.fixeHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;
  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    assert(() {
      if (child.key != null) {
        debugPrint(
            '${child.key}: shrink: $shrinkOffset,overlaps:$overlapsContent');
      }
      return true;
    }());
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}

Widget buildHeader(int i) {
  return Container(
    color: Colors.lightBlue.shade200,
    alignment: Alignment.centerLeft,
    child: Text("PersistentHeader $i"),
  );
}
