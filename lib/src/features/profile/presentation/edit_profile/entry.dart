import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  const Entry(
      {super.key,
      required this.controller,
      required this.title,
      required this.maxLine});

  final TextEditingController controller;
  final String title;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title
          Text(title, style: const TextStyle(color: Colors.grey)),

          // TextField
          TextField(
            controller: controller,
            maxLines: maxLine,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            ),
          )
        ],
      ),
    );
  }
}
