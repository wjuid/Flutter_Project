import 'package:flutter/material.dart';
import 'package:flutter_route/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RegisterPage"),
      ),
      body: Center(
        child: InkWell(
          child: const Text("Register scss go to homepage"),
          onTap: () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return const HomePage();
            }), (route) => false);
          },
        ),
      ),
    );
  }
}
