import 'package:contact_manger/features/contact_list/presentation/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ContactListMobile extends StatelessWidget {
  const ContactListMobile({super.key});

  @override
  Widget build(BuildContext context) {

  return  GetBuilder<ContactsController>(
    builder: (controller) {
      if (controller.status.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.status.isError) {
        return Center(child: Text(controller.status.errorMessage ?? 'Unknown error'));
      } else {
        return ListView.builder(
          controller: controller.scroll,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.state?.length??0,
          itemBuilder: (BuildContext context, int index) {
            final contact = controller.state![index];
            return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: ListTile(
                    title: Text(contact.displayName),
                    subtitle: Text(contact.phoneNumber),
                    leading:
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                    )
                ));
          },
        );

      }
    },
  );
  }
}
