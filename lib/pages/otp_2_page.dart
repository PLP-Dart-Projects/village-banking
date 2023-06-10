import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:villagebanking/widgets/button.dart';

class OTP2Page extends StatefulWidget {
  const OTP2Page({Key? key}) : super(key: key);

  @override
  State<OTP2Page> createState() => _OTP2PageState();
}

class _OTP2PageState extends State<OTP2Page> {


  @override
  Widget build(BuildContext context) {
    final pinController = TextEditingController();

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
              const Text("Enter the OTP sent to",
              style: TextStyle(
                fontSize: 19,
                ),
              ),
              Pinput(
                length: 4,
                keyboardType: TextInputType.number,
                controller: pinController,
                showCursor: true,
                isCursorAnimationEnabled: true,
                defaultPinTheme: const PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: TextStyle(
                    fontSize: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    border: Border(
                        bottom: BorderSide(color: Color.fromRGBO(39, 67, 253, 1)),
                    )
                  )
                ),
                cursor: const TextField(
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(245, 245, 245, 1)
                  ),
                ),
              ),
              InkWell(
                  onTap: () {

                  },
                  child: const CustomButtonColor(title: "Verify")),
            ],
          ),
        ),
      ),
    );
  }
}
