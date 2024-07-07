import 'package:contact_manger/features/task/data/model/contact_model.dart';
import 'package:contact_manger/features/call_log/presentation/controller/call_log_controller.dart';
import 'package:contact_manger/features/call_log/presentation/widget/text_field.dart';
import 'package:contact_manger/features/call_log/presentation/widget/value_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/contact_list_controller.dart';

class TaskContact extends StatelessWidget {
  const TaskContact({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CallLogController>();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        children: [
          ValueContact(
              icon: const Icon(Icons.person),
              text:
                  "name: ${"${controller.textEditingControllerName.text}"
                      " ${controller.textEditingControllerLastName.text}"}"),
          const SizedBox(
            height: 10,
          ),
          ValueContact(
              icon: const Icon(Icons.person),
              text: "phone: ${controller.textEditingControllerPhone.text}"),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            name: 'task',
            textEditingController: controller.textEditingControllerTask,
            icon: const Icon(Icons.task),
          ),
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: const StadiumBorder(),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                if (controller.checkValueTextField()) {
                  final newContact = ContactModel(
                    name:
                    "${controller.textEditingControllerName.text} ${controller.textEditingControllerLastName.text}",
                    phone: controller.textEditingControllerPhone.text,
                    task: controller.textEditingControllerTask.text,
                  );
                  Get.find<TaskController>().addContact(newContact);
                  controller.clearTextField();
                  Get.back();
                } else {
                  Get.showSnackbar(
                    const GetSnackBar(
                      message: 'Please fill all fields',
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: const Text(
                'Add Task',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
    );
  }
}
