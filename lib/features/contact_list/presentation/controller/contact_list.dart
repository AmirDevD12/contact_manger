import 'package:contact_manger/features/call_log/presentation/call_log.dart';
import 'package:contact_manger/features/contact_list/data/DataSources/local/contact_local.dart';
import 'package:contact_manger/features/contact_list/presentation/contact_list_mobilel.dart';
import 'package:contact_manger/features/task/presentation/contact_list_local.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final ContactService _contactService = ContactService();
  RxList contactsList = [].obs;

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

  Future<void> _initializeContacts() async {
    try {
      List<Contact> contacts = await _contactService.getContacts();
      contactsList.value = contacts;
      update();
    } catch (e) {
      print('Error initializing contacts: $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initializeContacts();
  }
}
