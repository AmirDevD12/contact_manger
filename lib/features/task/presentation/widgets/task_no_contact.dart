import 'package:contact_manger/features/call_log/data/models/contact_model.dart';
import 'package:contact_manger/features/call_log/presentation/controller/call_log_controller.dart';
import 'package:contact_manger/features/call_log/presentation/widget/text_field.dart';
import 'package:contact_manger/features/task/presentation/controller/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskNoContact extends StatelessWidget {
  const TaskNoContact({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CallLogController>();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        children: [
          TextFieldWidget(
            name: 'firstname ',
            textEditingController: controller.textEditingControllerName,
            icon: const Icon(Icons.person),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            name: 'lastname ',
            textEditingController: controller.textEditingControllerLastName,
            icon: const Icon(Icons.person),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            name: 'number phone',
            textEditingController: controller.textEditingControllerPhone,
            icon: const Icon(Icons.phone),
          ),
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
