import 'package:flutter/material.dart';

enum GridListDemoType {
  imageOnly,
  header,
  footer,
}

class _Photo {
  const _Photo({
    required this.assetName,
    required this.title,
    required this.subtitle,
  });
  final String assetName;
  final String title;
  final String subtitle;
}

class GridListDemo extends StatelessWidget {
  const GridListDemo({super.key, required this.type});

  final GridListDemoType type;
  static const List<_Photo> _photo = [
    _Photo(
      assetName: 'assets/images/1.jpg',
      title: 'Chennai',
      subtitle: 'Flower Market',
    ),
    _Photo(
      assetName: 'assets/images/2.jpg',
      title: 'Tanjore',
      subtitle: 'Bronze Works',
    ),
    _Photo(
      assetName: 'assets/images/3.jpg',
      title: 'Tanjore',
      subtitle: 'Market',
    ),
    _Photo(
      assetName: 'assets/images/4.jpg',
      title: 'Tanjore',
      subtitle: 'Thanjavur Temple',
    ),
    _Photo(
      assetName: 'assets/images/5.jpg',
      title: 'Tanjore',
      subtitle: 'Thanjavur Temple',
    ),
    _Photo(
      assetName: 'assets/images/6.jpg',
      title: 'Pondicherry',
      subtitle: 'Salt Farm',
    ),
    _Photo(
      assetName: 'assets/images/7.jpg',
      title: 'Chennai',
      subtitle: 'Scooters',
    ),
    _Photo(
      assetName: 'assets/images/8.jpg',
      title: 'Chettinad',
      subtitle: 'Silk Maker',
    ),
    _Photo(
      assetName: 'assets/images/9.jpg',
      title: 'Chettinad',
      subtitle: 'Lunch Prep',
    ),
    _Photo(
      assetName: 'assets/images/10.jpg',
      title: 'Tanjore',
      subtitle: 'Market',
    ),
    _Photo(
      assetName: 'assets/images/11.jpg',
      title: 'Pondicherry',
      subtitle: 'Beach',
    ),
    _Photo(
      assetName: 'assets/images/12.jpg',
      title: 'Pondicherry',
      subtitle: 'Fisherman',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Grid view"),
        ),
        body: GridView.count(
          restorationId: 'grid_view_demo_grid_offset',
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          childAspectRatio: 1,
          children: _photo.map<Widget>((photo) {
            return _GridDemoPhotoItem(
              photo: photo,
              titleStyle: type,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  const _GridDemoPhotoItem({
    required this.photo,
    required this.titleStyle,
  });
  final _Photo photo;
  final GridListDemoType titleStyle;

  @override
  Widget build(BuildContext context) {
    final Widget image = Semantics(
      label: '${photo.title} ${photo.subtitle}',
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          photo.assetName,
          fit: BoxFit.cover,
        ),
      ),
    );

    return switch (titleStyle) {
      GridListDemoType.imageOnly => image,
      GridListDemoType.header => GridTile(
          header: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            ),
            clipBehavior: Clip.antiAlias,
            child: GridTileBar(
              title: _GridTitleText(photo.title),
              backgroundColor: Colors.black45,
            ),
          ),
          child: image,
        ),
      GridListDemoType.footer => GridTile(
          footer: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
            ),
            clipBehavior: Clip.antiAlias,
            child: GridTileBar(
              backgroundColor: Colors.black45,
              title: _GridTitleText(photo.title),
              subtitle: _GridTitleText(photo.subtitle),
            ),
          ),
          child: image,
        ),
    };
  }
}

void main() {
  runApp(const GridListDemo(type: GridListDemoType.footer));
}
