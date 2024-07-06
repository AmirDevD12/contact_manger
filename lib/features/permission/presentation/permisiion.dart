import 'package:contact_manger/features/permission/presentation/controller/permision_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PermissionsController controller = Get.put(PermissionsController());

    return Scaffold(
      body: Obx(() => Center(child: controller.content.value)),
    );
  }
}
