import 'package:flutter/material.dart';
import 'package:villagebanking/widgets/custom_text_field.dart';
import 'package:villagebanking/widgets/sample.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const SamplePage(
      title: "Sign In",
      child: Column(
        children: [
          Text("Your path to awesome banking"),
          Text("Sign in"),
          CustomTextField(
            lableText: "Email Address",
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            lableText: "Password",
          ),
        ],
      ),
    );
  }
}
