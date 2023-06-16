import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:villagebanking/utilities/dialog.dart';
import 'package:villagebanking/utilities/exceptions.dart';

class ForgotPwPage extends StatefulWidget {
  const ForgotPwPage({Key? key}) : super(key: key);

  @override
  State<ForgotPwPage> createState() => _ForgotPwPageState();
}

class _ForgotPwPageState extends State<ForgotPwPage> {
  bool isValid = true;
  final TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _email.text.trim());
      if (context.mounted){
        showInfoDialog(context, 'Success', 'Password reset link sent,', 'Check your email!');
      }
    } on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found'){
        showErrorDialog(context, 'Error', 'The user was not found,'
            ' enter the correct email.');
        throw UserNotFoundAuthException();
    } else {
        showErrorDialog(context, 'Error', 'An error has occurred, try again.');
        throw GenericAuthException();
      }
    } catch (_){
      showErrorDialog(context, 'Error', _.toString());
      throw GenericAuthException();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(73, 96, 249, 1),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 50,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter your email and we will send a password reset link.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            TextField(
              controller: _email,
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: passwordReset,
                  color: const Color.fromRGBO(73, 96, 249, 1),
                  child: const Text('Reset Password',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
