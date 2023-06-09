import 'package:flutter/material.dart';
import 'package:villagebanking/pages/signInPage.dart';
import 'package:villagebanking/pages/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      ),
      home: const SignInPage(),
    );
  }
}