import 'package:flutter/material.dart';
import 'package:villagebanking/widgets/button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
              Text("Welcome Back",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CustomButtonGradient(
                title: "Sign in",
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtonPlain(
                title: "Sign up",
              )
            ],
          ),
        ),
      ),
    );
  }
}
