import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

enum BottomNavigationDemoType {
  withLables,
  withoutLables,
}

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({
    super.key,
    required this.restorationId,
    required this.type,
  });
  final String restorationId;
  final BottomNavigationDemoType type;

  @override
  State<BottomNavigationDemo> createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo>
    with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);
  @override
  String get restorationId => widget.restorationId;
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.add_comment),
        label: 'Comments',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Calendar',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Accounmt',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.alarm_on),
        label: 'Alarm',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.camera_enhance),
        label: 'Camera',
      ),
    ];

    if (widget.type == BottomNavigationDemoType.withLables) {
      bottomNavigationBarItems = bottomNavigationBarItems.sublist(
          0, bottomNavigationBarItems.length - 2);

      _currentIndex.value = _currentIndex.value
          .clamp(0, bottomNavigationBarItems.length - 1)
          .toInt();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            switch (widget.type) {
              BottomNavigationDemoType.withLables => 'Persistent lables',
              BottomNavigationDemoType.withoutLables => 'Selected label',
            },
          ),
        ),
        body: Center(
          child: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 10000),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              /*  return FadeThroughTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  child: child); */
              return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.scaled,
                child: child,
              );
            },
            child: _NavigationDestinationView(
              key: UniqueKey(),
              item: bottomNavigationBarItems[_currentIndex.value],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels:
              widget.type == BottomNavigationDemoType.withLables,
          items: bottomNavigationBarItems,
          currentIndex: _currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: textTheme.bodySmall!.fontSize!,
          unselectedFontSize: textTheme.bodySmall!.fontSize!,
          onTap: (index) {
            setState(() {
              _currentIndex.value == index;
            });
          },
          selectedItemColor: colorScheme.onPrimary,
          unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
          backgroundColor: colorScheme.primary,
        ),
      ),
    );
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({
    super.key,
    required this.item,
  });

  final BottomNavigationBarItem item;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExcludeSemantics(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/images/pic.jpg'),
              ),
            ),
          ),
        ),
        Center(
          child: IconTheme(
            data: const IconThemeData(
              color: Colors.white,
              size: 80,
            ),
            child: Semantics(
              label: 'Placeholder for ${item.label} tab',
              child: item.icon,
            ),
          ),
        )
      ],
    );
  }
}

void main() {
  runApp(const BottomNavigationDemo(
      restorationId: 'bottom_navigation_lables_demo',
      type: BottomNavigationDemoType.withLables));
}
