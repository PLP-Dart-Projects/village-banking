import 'package:flutter/material.dart';
import 'package:villagebanking/pages/sign_up_page.dart';
import 'package:villagebanking/pages/sign_in_page.dart';
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
                  Navigator.push(
                      context, MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                    ),
                  );
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
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                  );
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
