import 'package:contact_manger/core/widgets/bottom_navigation_bar.dart';
import 'package:contact_manger/core/widgets/search_contact.dart';
import 'package:contact_manger/features/contact_list/presentation/controller/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
   const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ContactListController>();

    return Scaffold(
      appBar: AppBar(title: const SearchContact()),

      bottomNavigationBar: BottomNavigationBarWidget(
          onTap: (int number) {
            controller.updateIndex(number);
          },
        ),

      body:GetBuilder<ContactListController>(
        init: ContactListController(),
          builder: (contactController){
        return contactController.pages[contactController.currentIndex.value];
      }),
    );
  }
}
