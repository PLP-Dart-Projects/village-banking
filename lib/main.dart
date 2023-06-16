import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:villagebanking/pages/home_page.dart';
import 'package:villagebanking/pages/main_page.dart';
import 'package:villagebanking/pages/otp_1_page.dart';
import 'package:villagebanking/pages/sign_in_page.dart';
import 'package:villagebanking/pages/sign_up_page.dart';
import 'package:villagebanking/pages/welcome_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: 'main',
      routes: {
        'main': (context) => const MainPage(),
        'welcome': (context) => const WelcomePage(),
        'signIn': (context) => const SignInPage(),
        'signUp': (context) => const SignUpPage(),
        'otp1': (context) => const OTP1Page(),
        'home': (context) => const HomePage(),
      },
    );
  }
}