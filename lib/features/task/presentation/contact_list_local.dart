
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/contact_list_controller.dart';

class TaskList extends StatelessWidget {

   const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController contactController = Get.find<TaskController>();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text("Task manger",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        Obx(() {
          if (contactController.contacts.isEmpty) {
            return const Center(child: Text('No task available'));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: contactController.contacts.length,
              itemBuilder: (context, index) {
                final contact = contactController.contacts[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: ListTile(
                    title: Text("name: ${contact.name}"),
                    subtitle: Text('Phone: ${contact.phone}'),
                   trailing: IconButton(onPressed: (){
                     contactController.removeItemBox(index);
                   }, icon: const Icon(Icons.delete)),
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                            title: Text(contact.name),
                            content: Center(child: Text(contact.task,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),)),

                      );
                    },
                  ),
                );
              },

            );
          }
        }),
      ],
    );
  }

}
