import 'package:contact_manger/core/widgets/bottom_navigation_bar.dart';
import 'package:contact_manger/core/widgets/search_contact.dart';
import 'package:contact_manger/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
   const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: const SearchContact()),

      bottomNavigationBar: BottomNavigationBarWidget(
          onTap: (int number) {
            controller.updateIndex(number);
          },
        ),

      body:Obx(()=>controller.pages[controller.currentIndex.value]
      ),
    );
  }
}
