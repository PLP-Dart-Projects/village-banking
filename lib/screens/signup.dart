import 'package:flutter/material.dart';
import 'package:villagebanking/widgets/sample.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SamplePage(
      title: "Sign Up",
      child: Center(
        child: Text("Sign Up page"),
      ),
    );
  }
}
