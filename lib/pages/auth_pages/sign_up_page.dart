import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:villagebanking/pages/auth_pages/otp_1_page.dart';
import 'package:villagebanking/utilities/dialog.dart';
import 'package:villagebanking/utilities/exceptions.dart';
import 'package:villagebanking/widgets/button.dart';


//await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordVisible = true;
  bool isValid = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }


  Future signUp() async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _confirmPass.text.trim()
      );
    } on FirebaseAuthException catch (e){
      if (e.code == 'email-already-in-use'){
        showErrorDialog(context, 'Error', 'Email is already in use');
        throw EmailAlreadyInUseAuthException();
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
    const String title = 'Password Rules';
    const String line1 = 'Password must contain:';
    const String line2 = 'At least 1 uppercase, 1 lowercase, one digit,'
        ' 1 special character and be at least 8 characters long.';
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            bottom: 30,
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text("Welcome",
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Text("Sign up",
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(58, 58, 58, 1)
                  ),
                ),
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Empty';
                    }
                    return null;
                  },
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
                TextFormField(
                    controller: _pass,
                    obscureText: passwordVisible,
                    validator: (value) {
                      RegExp regex =
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])'
                      r'(?=.*?[!@#\$&*~]).{8,}$');
                      if(value == null || value.isEmpty){
                        return 'Empty';
                      } else if(!regex.hasMatch(value)){
                        return 'Enter valid Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text("Password",
                      style: TextStyle(
                        color: Color.fromRGBO(185, 185, 185, 1)
                        ),
                      ),
                      suffixIcon: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () async{
                                await showInfoDialog(context, title, line1, line2);
                                },
                              icon: const Icon(Icons.info_outlined),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(passwordVisible? Icons.visibility_sharp :
                                Icons.visibility_off_sharp
                                ),
                            ),
                          ],
                        ),
                      )
                    ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                TextFormField(
                    controller: _confirmPass,
                    obscureText: passwordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Empty';
                      }
                      else if(_confirmPass.text != _pass.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text("Confirm Password",
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
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await signUp();
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTP1Page(),
                        ),
                        ModalRoute.withName('welcome'),
                      );
                      }
                    }
                  },
                  child: const CustomButtonGradient(
                    title: "Sign up",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
