import 'package:flutter/material.dart';
import 'package:flutter_route/routes.dart';

class SearchPage extends StatelessWidget {
  final arguments;
  const SearchPage({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SearchPage"),
      ),
      body: Center(
        child: InkWell(
          child: Text("search page content zoom: $arguments"),
          onTap: () {
            Navigator.pushReplacementNamed(context, loginPage);
          },
        ),
      ),
    );
  }
}
