import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:villagebanking/widgets/button.dart';

class OTP1Page extends StatefulWidget {
  const OTP1Page({Key? key}) : super(key: key);

  @override
  State<OTP1Page> createState() => _OTP1PageState();
}

class _OTP1PageState extends State<OTP1Page> {


  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(
        isoCode: Platform.localeName.split('_').last
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              bottom: 30,
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
                image: AssetImage("assets/images/OTP_1.png"),
              ),
              const Text("OTP Verification",
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("  We will send you a one -time password to this mobile number",
              style: TextStyle(
                fontSize: 19,
                ),
              ),
              InternationalPhoneNumberInput(
                  onInputChanged: (value) {},
                selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true
                ),
                initialValue: number,
                countrySelectorScrollControlled: true,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'otp2');
                  },
                  child: const CustomButtonColor(title: "Get OTP")),
            ],
          ),
        ),
      ),
    );
  }
}
