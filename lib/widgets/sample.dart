import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({
    required this.title,
    required this.child,
    super.key,
  });
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Text(''),
                ],
              ),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
