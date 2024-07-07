import 'package:contact_manger/features/call_log/presentation/call_log.dart';
import 'package:contact_manger/features/contact_list/presentation/contact_list_mobilel.dart';
import 'package:contact_manger/features/task/presentation/contact_list_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

TextEditingController searchController = TextEditingController();
  Rx<int> currentIndex = 0.obs;
  final List<Widget> pages = [
    const ContactListMobile(),
    const TaskList(),
    const CallLogScreen(),
  ];

  void updateIndex(int index) {
    currentIndex.value = index;
    update();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
