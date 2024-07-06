import 'package:contact_manger/features/call_log/presentation/controller/call_log_controller.dart';
import 'package:contact_manger/features/contact_list/Domain/use_cases/fetch_contacts.dart';
import 'package:contact_manger/features/contact_list/data/repository/contact_repository_impl.dart';
import 'package:contact_manger/features/contact_list/presentation/controller/contact_controller.dart';
import 'package:contact_manger/features/home/presentation/controller/home_controller.dart';
import 'package:contact_manger/features/task/presentation/controller/contact_list_controller.dart';
import 'package:get/get.dart';

class ContactListMobileBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
      Get.put(ContactController(FetchContacts(ContactRepositoryImpl())));
      Get.put(HomeController());
      Get.put(CallLogController());
      Get.put(TaskController());
  }

}