import 'package:contact_manger/features/contact_list/presentation/widgets/massenger_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsController extends GetxController {
  Rx<Widget> content = const CircularProgressIndicator().obs;

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  void checkPermission() async {
    PermissionStatus statusPhone = await Permission.phone.status;
    PermissionStatus statusContacts = await Permission.contacts.status;

    if (statusPhone.isGranted && statusContacts.isGranted) {
      _openTabsScreen();
    } else if (statusContacts.isPermanentlyDenied ||
        statusPhone.isPermanentlyDenied) {
      await openAppSettings();
      _closeApp();
    } else {
      _getCallsPermissions();
    }
  }

  void _getCallsPermissions() async {
    PermissionStatus statusPhone = await Permission.phone.request();
    PermissionStatus statusContacts = await Permission.contacts.request();

    if (statusPhone.isGranted && statusContacts.isGranted) {
      _openTabsScreen();
    } else if (statusContacts.isPermanentlyDenied ||
        statusPhone.isPermanentlyDenied) {
      await openAppSettings();
      _closeApp();
    } else {
      content.value = Messenger(
        msg: "Permission Denied",
        allowFunction: _openTabsScreen,
        closeAppFunction: _closeApp,
      );
    }
  }

  void _openTabsScreen() {
    Get.offAndToNamed("/home");
  }

  void _closeApp() {
    SystemNavigator.pop();
  }
}
