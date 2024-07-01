import 'package:contact_manger/features/contact_list/presentation/controller/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchContact extends StatelessWidget {
  const SearchContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),

      child:TextField(
        controller: Get.find<ContactListController>().searchController,
        decoration: const InputDecoration(
          labelText: 'Search Contact',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
