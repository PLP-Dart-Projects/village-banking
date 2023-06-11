import 'package:flutter/material.dart';
import 'package:villagebanking/pages/otp_1_page.dart';
import 'package:villagebanking/pages/sign_in_page.dart';
import 'package:villagebanking/pages/sign_up_page.dart';
import 'package:villagebanking/pages/welcome_page.dart';

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
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => const WelcomePage(),
        'signIn': (context) => const SignInPage(),
        'signUp': (context) => const SignUpPage(),
        'otp1': (context) => const OTP1Page(),
      },
    );
  }
}