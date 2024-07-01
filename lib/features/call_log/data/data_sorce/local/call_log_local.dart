import 'dart:async';

import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class CallLogs {
  void call(String text) async {
  }

  Widget getAvatar(CallType callType) {
    switch (callType) {
      case CallType.outgoing:
        return const CircleAvatar(
          maxRadius: 30,
          foregroundColor: Colors.green,
          backgroundColor: Colors.greenAccent,
        );
      case CallType.missed:
        return CircleAvatar(
          maxRadius: 30,
          foregroundColor: Colors.red[400],
          backgroundColor: Colors.red[400],
        );
      default:
        return CircleAvatar(
          maxRadius: 30,
          foregroundColor: Colors.indigo[700],
          backgroundColor: Colors.indigo[700],
        );
    }
  }

  Future<Iterable<CallLogEntry>> getCallLogs() async {

    return await CallLog.get();
  }
  Future<Iterable<CallLogEntry>> fetchCallLogs() async {
    // Request call logs with a limit
    Iterable<CallLogEntry> entries = await CallLog.query();
    return entries;
  }

  // String formatDate(DateTime dt) {
  //   return DateFormat('d-MMM-y H:m:s').format(dt);
  // }

  Widget getTitle(CallLogEntry entry) {
    if (entry.name == null || entry.name!.isEmpty) {
      return Text(entry.number ?? 'Unknown');
    } else {
      return Text(entry.name ?? 'Unknown');
    }
  }

  String getTime(int duration) {
    Duration d1 = Duration(seconds: duration);
    String formattedDuration = "";
    if (d1.inHours > 0) {
      formattedDuration += "${d1.inHours}h ";
    }
    if (d1.inMinutes > 0) {
      formattedDuration += "${d1.inMinutes % 60}m ";
    }
    if (d1.inSeconds > 0) {
      formattedDuration += "${d1.inSeconds % 60}s";
    }
    if (formattedDuration.isEmpty) return "0s";
    return formattedDuration;
  }
}