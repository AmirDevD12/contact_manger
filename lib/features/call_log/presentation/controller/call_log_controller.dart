import 'dart:async';

import 'package:call_log/call_log.dart';
import 'package:contact_manger/features/call_log/data/data_sorce/local/shared_preferences.dart';
import 'package:contact_manger/features/task/presentation/widgets/task_contact.dart';
import 'package:contact_manger/features/task/presentation/widgets/task_no_contact.dart';
import 'package:contact_manger/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class CallLogController extends GetxController {

  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  TextEditingController textEditingControllerTask = TextEditingController();
  var callLogs = <CallLogEntry>[].obs;
  var isLoading = true.obs;
  final StreamController<int> _callLogStreamController =
      StreamController.broadcast();
  Timer? timer;
  final sharedPreferences = getIt<saveSharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    fetchCallLogs();
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      checkForCallLogChanges();
    });
    _callLogStreamController.stream.listen((newSize) {
      Get.bottomSheet(
          isDismissible: false,
          enableDrag: false,
          callLogs.first.name != null && callLogs.first.name!=""
              ? const TaskContact()
              : const TaskNoContact());
    });
  }

  void fetchCallLogs() async {
    try {
      isLoading(true);
      final logs = await CallLog.get();
      callLogs.assignAll(logs);
      if (await sharedPreferences.load() == -1) {
        sharedPreferences.saveLengthLog(callLogs.length);
      }
    } catch (e) {

    } finally {
      isLoading(false);
    }
  }

  void checkForCallLogChanges() async {
    final length = await sharedPreferences.load();
    try {
      final logs = await CallLog.get();
      if (logs.length != length && length != -1) {
        sharedPreferences.saveLengthLog(logs.length);
        callLogs.assignAll(logs);
        textEditingControllerName.text = callLogs.first.name ?? "";
        textEditingControllerPhone.text = callLogs.first.number ?? "";
        _callLogStreamController.add(logs.length);
      }
    } catch (e) {}
  }

  void callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);

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

  bool checkValueTextField() {
    if (textEditingControllerName.text.isEmpty ||
        textEditingControllerPhone.text.isEmpty ||
        textEditingControllerTask.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
  void clearTextField() {
    textEditingControllerName.clear();
    textEditingControllerLastName.clear();
    textEditingControllerPhone.clear();
    textEditingControllerTask.clear();
  }
}
