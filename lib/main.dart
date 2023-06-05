import 'package:flutter/material.dart';
import 'package:villagebanking/widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            bottom: 30,
          ),
          child: const Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text("Welcome Back"),
              Spacer(),
              CustomButton(
                title: "Sign in",
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                title: "Sign up",
              )
            ],
          ),
        ),
      ),
    );
  }
}
