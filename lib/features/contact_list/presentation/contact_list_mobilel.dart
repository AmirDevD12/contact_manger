import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/contact_list.dart';

class ContactListMobile extends StatelessWidget {
  const ContactListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ContactListController>();

    return GetBuilder(builder: (ContactListController contactController) {
      return contactController.contactsList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.contactsList.length,
              itemBuilder: (BuildContext context, int index) {
                Contact contact = controller.contactsList[index];
                String displayName = contact.displayName ?? "";
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ListTile(
                      title: Text(displayName.isNotEmpty
                          ? displayName
                          : contact.displayName ?? ""),
                      subtitle: Text(contact.phones?.isNotEmpty == true
                          ? contact.phones!.first.value ?? ''
                          : 'No phone number'),
                      leading: contact.avatar != null
                          ? const CircleAvatar(
                              backgroundColor: Colors.blue,
                            )
                          : const Icon(Icons.person),
                    ));
              },
            );
    });
  }
}
