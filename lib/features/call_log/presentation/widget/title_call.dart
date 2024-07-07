import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class TitleCall extends StatelessWidget {
 final String name;
  const TitleCall({super.key, required this.name});


  @override
  Widget build(BuildContext context) {
    if (name !="" || name.isNotEmpty) {
      return Text(name);
    } else {
      return const Text( 'Unknown');
    }
  }
}
