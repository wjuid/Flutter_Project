import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPracticePage extends StatefulWidget {
  const HttpPracticePage({super.key});

  @override
  _HttpPracticeState createState() => _HttpPracticeState();
}

class _HttpPracticeState extends State<HttpPracticePage> {
  var list = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("http shizhan"),
          ),
          body: list.isNotEmpty
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${list[index]["name"]}"),
                      subtitle: Text("${list[index]["link"]}"),
                    );
                  },
                )
              : const Text(" ")),
    );
  }

  void _getData() async {
    var uri = Uri.https("www.wanandroid.com", "/friend/json");
    var result = await http.get(uri);
    if (result.statusCode == 200) {
      var map = json.decode(result.body) as Map<String, dynamic>;
      setState(() {
        list = map["data"];
      });
    }
  }
}

class Txxt {}

void main() {
  runApp(const HttpPracticePage());
}
