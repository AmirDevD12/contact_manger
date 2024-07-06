import 'dart:async';
import 'package:contact_manger/core/error_handling/app_exception.dart';
import 'package:contact_manger/core/error_handling/check_exceptions.dart';
import 'package:contact_manger/core/network/dio.dart';
import 'package:contact_manger/core/resources/data_state.dart';
import 'package:contact_manger/features/call_log/data/models/contact_model.dart';
import 'package:contact_manger/locator.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class TaskController extends GetxController {
  var contacts = <ContactModel>[].obs;
  final box = Hive.box<ContactModel>('contactsBox');

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
    scheduleDataUpload();
  }

  Future<void> fetchContacts() async {
    contacts.value = box.values.toList();
  }

  Future<void> addContact(ContactModel contact) async {
    await box.add(contact);
    contacts.add(contact);
  }
  removeItemBox(int index){
    box.deleteAt(index);
    fetchContacts();
  }
  void scheduleDataUpload() {
    Timer.periodic(const Duration(hours: 1), (timer) async {
      await sendDataToServer();
    });
  }

  Future<void> sendDataToServer() async {
   final dio = getIt<DioHttpClient>();
   final box = Hive.box<ContactModel>('contactsSend');
   final listSendContact = box.values.toList();
    try {
      checkRepetitious(contacts,listSendContact);
      List<Map<String, dynamic>> contactsList = contacts.map((contact) =>
      {
        'name': contact.name,
        'phone': contact.phone,
        'task': contact.task,
      }).toList();

      final response = await dio.get("", {}, contactsList , Options());
      for (var contact in contacts) {
        box.add(contact);
      }
      DataSuccess(response);
    }on AppException catch(e){
      return await CheckExceptions.getError(e);
    }}
  void checkRepetitious(List<ContactModel> list1, List<ContactModel> list2){
    for (int i = 0; i < list1.length; i++) {
      if (list1[i].name != list2[i].name ||
          list1[i].phone != list2[i].phone ||
          list1[i].task != list2[i].task) {
        list1.removeAt(i);
      }
    }
  }
}
