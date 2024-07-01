import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class TitleCall extends StatelessWidget {
 final CallLogEntry entry;
  const TitleCall({super.key, required this.entry});


  @override
  Widget build(BuildContext context) {
    if (entry.name == null || entry.name!.isEmpty) {
      return Text(entry.number ?? 'Unknown');
    } else {
      return Text(entry.name ?? 'Unknown');
    }
  }
}
