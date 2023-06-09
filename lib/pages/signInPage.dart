import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:villagebanking/widgets/button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool passwordVisible = true;
  bool isValid = true;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }


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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text("Your path to awesome banking",
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Text("Sign in",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(58, 58, 58, 1)
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    isValid = EmailValidator.validate(value);
                  });
                },
                keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'design@test.com',
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(58, 58, 58, 1),
                    ),
                    label: const Text("Email Address",
                    style: TextStyle(
                      color: Color.fromRGBO(185, 185, 185, 1)
                      ),
                    ),
                    suffixIcon: Icon( isValid? Icons.check_sharp:
                    Icons.close_sharp,
                      color: const Color.fromRGBO(203, 62, 249, 1),
                    ),
                  ),
              ),
              TextField(
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    label: const Text("Password",
                    style: TextStyle(
                      color: Color.fromRGBO(185, 185, 185, 1)
                      ),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(passwordVisible? Icons.visibility_sharp :
                        Icons.visibility_off_sharp
                        ),
                    )
                  ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
              const Spacer(),
              const CustomButtonGradient(
                title: "Sign in",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
