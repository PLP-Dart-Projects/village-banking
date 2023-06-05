import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.arrow_forward_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
