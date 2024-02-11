import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ListView Widget'),
          elevation: 30,
        ),
        body: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final mDataList = [
    {
      'title': 'title1',
      'desc': 'description1',
      'image': 'assets/images/111.png'
    },
    {
      'title': 'title2',
      'desc': 'description2',
      'image': 'assets/images/111.png'
    },
    {
      'title': 'title3',
      'desc': 'description3',
      'image': 'assets/images/111.png'
    },
    {
      'title': 'title4',
      'desc': 'description4',
      'image': 'assets/images/111.png'
    },
    {
      'title': 'title5',
      'desc': 'description5',
      'image': 'assets/images/111.png'
    },
    {
      'title': 'title6',
      'desc': 'description6',
      'image': 'assets/images/111.png'
    },
    {
      'title': 'title7',
      'desc': 'description7',
      'image': 'assets/images/111.png'
    },
    {
      'title': 'title8',
      'desc': 'description8',
      'image': 'assets/images/111.png'
    },
  ];
  List<Widget> _getListWidget() {
    final listWidget = mDataList.map((value) {
      return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1.0)),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  value["image"] ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                value["title"] ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ));
    });
    return listWidget.toList();
  }

  @override
  Widget build(BuildContext context) {
    /*   return ListView.builder(
        itemCount: mDataList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: ClipOval(
                    child: Image.asset(
                  mDataList[index]["image"] ?? "",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )),
                title: Text(mDataList[index]["title"] ?? ""),
                subtitle: Text(mDataList[index]["desc"] ?? ""),
              ),
              const Divider(),
            ],
          );
        }); */
    return GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: _getListWidget());
  }
}
