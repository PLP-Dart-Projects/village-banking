import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:villagebanking/pages/otp_2_page.dart';
import 'package:villagebanking/widgets/button.dart';

class OTP1Page extends StatefulWidget {
  const OTP1Page({Key? key}) : super(key: key);

  @override
  State<OTP1Page> createState() => _OTP1PageState();
}

class _OTP1PageState extends State<OTP1Page> {
  String? savedNumber;
  final numController = TextEditingController();
  PhoneNumber number = PhoneNumber(
      isoCode: Platform.localeName.split('_').last
  );

  String formatPhoneNumber (String? dialCode, String? phoneNumber){
    final String? code = dialCode;
    final String? num = phoneNumber;

    var num2 = num!.substring(code!.length);

    // Split the codeless number to a known format
    var num3 = num2.replaceAllMapped(
        RegExp(r'(\d{3})(\d{3})(\d+)'), (Match m) => "${m[1]} ${m[2]} ${m[3]}"
    );
    var formattedNum = [code,num3].join(" ");
    return formattedNum;
  }


  @override
  void initState() {
    super.initState();
    savedNumber = '';
  }

  @override
  void dispose() {
    savedNumber;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
              bottom: 30,
            ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/18,),
              const Image(
                image: AssetImage("assets/images/OTP_1.png"),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/13,),
              const Text("OTP Verification",
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              const Text("  We will send you a one-time password to this mobile number",
              style: TextStyle(
                fontSize: 19,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              const Text("Enter mobile number",
              style: TextStyle(
                  color: Color.fromRGBO(185, 185, 185, 1)
                ),
              ),
              InternationalPhoneNumberInput(
                textFieldController: numController,
                errorMessage: 'Please enter your dial',
                autoValidateMode: AutovalidateMode.onUserInteraction,
                onInputChanged: (value) {
                  setState(() {
                    savedNumber = formatPhoneNumber(value.dialCode, value.phoneNumber);
                  });
                },
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
              const Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTP2Page(phone: savedNumber),
                          )
                      );
                    },
                  child: const CustomButtonColor(title: "Get OTP")),
            ],
          ),
        ),
      ),
    );
  }
}
