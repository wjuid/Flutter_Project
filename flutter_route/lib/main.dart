import 'package:flutter/material.dart';
import 'package:flutter_route/routes.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    initialRoute: homePage,
    onGenerateRoute: onGenerateRoute,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(" jump to SearchPage"),
          onPressed: () {
            /*   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const SearchPage(arguments: "erdai666");
            })); */
            /* Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SearchPage(); 
            }));*/
            //Navigator.pushNamed(context, searchPage, arguments: "erda666");
            Navigator.of(context).pushNamed(searchPage);
          },
        ),
      ),
    );
  }
}
