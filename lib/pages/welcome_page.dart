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
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text("Welcome Back",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'signIn');
                },
                child: const CustomButtonGradient(
                  title: "Sign in",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'signUp');
                },
                child: const CustomButtonPlain(
                  title: "Sign up",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
