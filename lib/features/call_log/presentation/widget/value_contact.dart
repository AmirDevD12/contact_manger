import 'package:flutter/material.dart';

class ValueContact extends StatelessWidget {
  final Icon icon;
  final String text;
  const ValueContact({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children:  [
          icon,
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
