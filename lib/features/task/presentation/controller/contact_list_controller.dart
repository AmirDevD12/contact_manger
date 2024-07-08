import 'dart:async';
import 'package:contact_manger/core/error_handling/app_exception.dart';
import 'package:contact_manger/core/error_handling/check_exceptions.dart';
import 'package:contact_manger/core/network/dio.dart';
import 'package:contact_manger/core/resources/data_state.dart';
import 'package:contact_manger/core/usecase/usecase.dart';
import 'package:contact_manger/features/task/data/model/task_model.dart';
import 'package:contact_manger/features/task/domain/usecases/get_task.dart';
import 'package:contact_manger/locator.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
class TaskController extends GetxController {
  final GetTask getTask;
  TaskController({required this.getTask});
  final dio = getIt<DioHttpClient>();
  var contacts = <TaskModel>[].obs;
  final box = Hive.box<TaskModel>('contactsBox');

  @override
  void onInit() {
    super.onInit();

    fetchContacts();
  }

  Future<void> fetchContacts() async {
    contacts.value = box.values.toList();
  }

  Future<void> addContact(TaskModel contact) async {
    await box.add(contact);
    contacts.add(contact);
  }

  removeItemBox(int index) {
    box.deleteAt(index);
    fetchContacts();
  }



  Future<void> sendDataToServer() async {
    final result =getTask(NoParams());
  }

  void checkRepetitious() {
    final box = Hive.box<TaskModel>('contactsSend');
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
