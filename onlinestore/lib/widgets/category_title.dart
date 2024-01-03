import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black54)),
        TextButton(onPressed: () {}, child: const Text('See more'))
      ]),
    );
  }
}
