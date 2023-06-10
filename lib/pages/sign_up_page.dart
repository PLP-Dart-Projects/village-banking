import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:villagebanking/pages/otp_1_page.dart';
import 'package:villagebanking/widgets/button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordVisible = true;
  bool isValid = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

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
                      if(value == null || value.isEmpty){
                        return 'Empty';
                      }
                      return null;
                    },
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
                  onTap: () {
                    if (_formKey.currentState!.validate()){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTP1Page(),
                        ),
                        ModalRoute.withName('welcome'),
                      );
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
