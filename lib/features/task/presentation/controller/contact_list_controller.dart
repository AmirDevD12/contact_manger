import 'dart:async';
import 'package:contact_manger/core/error_handling/app_exception.dart';
import 'package:contact_manger/core/error_handling/check_exceptions.dart';
import 'package:contact_manger/core/network/dio.dart';
import 'package:contact_manger/core/resources/data_state.dart';
import 'package:contact_manger/features/task/data/model/contact_model.dart';
import 'package:contact_manger/locator.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
class TaskController extends GetxController {
  final dio = getIt<DioHttpClient>();
  var contacts = <ContactModel>[].obs;
  final box = Hive.box<ContactModel>('contactsBox');

  @override
  void onInit() {
    super.onInit();
    // Workmanager().registerPeriodicTask(
    //   "1",
    //   "simple",
    //   frequency: const Duration(hours: 1), // Schedule to run every hour
    // );
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    contacts.value = box.values.toList();
  }

  Future<void> addContact(ContactModel contact) async {
    await box.add(contact);
    contacts.add(contact);
  }

  removeItemBox(int index) {
    box.deleteAt(index);
    fetchContacts();
  }



  Future<void> sendDataToServer() async {
      try {
        List<Map<String, dynamic>> contactsFromMapList =
        contacts.map((map) => map.toMap()).toList();

        final response = await dio.get("", {}, contactsFromMapList, Options());
        for (var contact in contacts) {
          box.add(contact);
        }
        DataSuccess(response);
      } on AppException catch (e) {
        return await CheckExceptions.getError(e);
      }

  }

  void checkRepetitious() {
    final box = Hive.box<ContactModel>('contactsSend');
    final listSendContact = box.values.toList();
    for (int i = 0; i < contacts.length; i++) {
      if (contacts[i].name != listSendContact[i].name ||
          contacts[i].phone != listSendContact[i].phone ||
          contacts[i].task != listSendContact[i].task) {
        contacts.removeAt(i);
      }
    }
  }
}
