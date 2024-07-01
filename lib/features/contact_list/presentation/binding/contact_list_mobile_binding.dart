import 'package:contact_manger/features/call_log/presentation/controller/call_log_controller.dart';
import 'package:contact_manger/features/contact_list/presentation/controller/contact_list.dart';
import 'package:contact_manger/features/task/presentation/controller/contact_list_controller.dart';
import 'package:get/get.dart';

class ContactListMobileBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
      Get.put(ContactListController());
      Get.put(CallLogController());
      Get.put(TaskController());
  }

}