import 'package:flutter/material.dart';

class ErrorScren extends StatelessWidget {
  const ErrorScren({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Couldn't complete request")));
  }
}
