import 'package:flutter/material.dart';
import 'package:villagebanking/widgets/button.dart';
import 'package:villagebanking/widgets/user_form.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({Key? key}) : super(key: key);

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetupPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, 'signUp');
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 35,
            right: 35,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/3.5,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/Camera_1.png'),
              ),
              const UserForm(),
              const Spacer(),
              const CustomButtonColor(title: 'Complete')
            ],
          ),
        ),
      ),
    );
  }
}
