import 'package:flutter/material.dart';

class TitleCall extends StatelessWidget {
 final String name;
 final String number;
  const TitleCall({super.key, required this.name, required this.number});


  @override
  Widget build(BuildContext context) {
    if (name !="" || name.isNotEmpty) {
      return Text(name);
    } else {
      return Text(number);
    }
  }
}
