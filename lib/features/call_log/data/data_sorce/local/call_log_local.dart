import 'dart:async';

import 'package:call_log/call_log.dart';
import 'package:contact_manger/features/call_log/data/models/call_log_model.dart';
import 'package:flutter/material.dart';

abstract class CallLogsDataSourceLocal {
  Future<List<CallLogModel>> getCallLogs();
}

class CallLogLocalDataSourceImpl implements CallLogsDataSourceLocal {
  @override
  Future<List<CallLogModel>> getCallLogs() async {
    Iterable<CallLogEntry> entries = await CallLog.get();
    List<CallLogModel> callLogs =
        entries.map((entry) => CallLogModel.fromCallLogEntry(entry)).toList();
    return callLogs;
  }
}
