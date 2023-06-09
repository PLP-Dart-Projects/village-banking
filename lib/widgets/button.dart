import 'package:flutter/material.dart';

class CustomButtonGradient extends StatelessWidget {
  const CustomButtonGradient({
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
        gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(255, 71, 20, 1),
              Color.fromRGBO(73, 96, 249, 1),
              //Color.fromRGBO(20, 51, 255, 1),
            ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
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
            Icons.arrow_forward_sharp,
            color: Colors.white,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}

class CustomButtonPlain extends StatelessWidget {
  const CustomButtonPlain({
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
            color: const Color.fromRGBO(39, 67, 253,1),
            width: 2.0,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(39, 67, 253,1),
            ),
          ),
          const Icon(
            Icons.arrow_forward_sharp,
            color: Color.fromRGBO(39, 67, 253,1),
            size: 30.0,
          ),
        ],
      ),
    );
  }
}

class CustomButtonColor extends StatelessWidget {
  const CustomButtonColor({
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
      width: 320,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(39, 67, 253,1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
