import 'package:flutter/material.dart';
import 'package:onlinestore/screens/error.dart';

class ReusableBtn extends StatelessWidget {
  const ReusableBtn({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ErrorScren()));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            height: 40,
            width: 100,
            child: Center(child: Text(title))));
  }
}
