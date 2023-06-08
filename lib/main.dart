import 'package:flutter/material.dart';
import 'package:villagebanking/screens/signin.dart';
import 'package:villagebanking/screens/signup.dart';
import 'package:villagebanking/widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      routes: {
        "/signin": (context) => const SignIn(),
        "/signup": (context) => const SignUp(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentValue = 0;

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
              SizedBox(
                height: 40,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: CustomButton(
                  title: "Sign in",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/signup'),
                child: CustomButton(
                  title: "Sign up",
                  outline: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
