import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.lableText,
    super.key,
  });
  final String lableText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.mail),
        labelText: lableText,
      ),
    );
  }
}
