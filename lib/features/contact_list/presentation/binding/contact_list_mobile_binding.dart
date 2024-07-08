import 'package:contact_manger/core/network/dio.dart';
import 'package:contact_manger/features/call_log/data/data_sorce/local/call_log_local.dart';
import 'package:contact_manger/features/call_log/data/repository/call_log_repository_imp.dart';
import 'package:contact_manger/features/call_log/domain/usecases/fetch_call_log.dart';
import 'package:contact_manger/features/call_log/presentation/controller/call_log_controller.dart';
import 'package:contact_manger/features/contact_list/data/data_sources/local/contact_local.dart';
import 'package:contact_manger/features/contact_list/data/repository/contact_repository_impl.dart';
import 'package:contact_manger/features/contact_list/domain/usecases/fetch_contacts.dart';
import 'package:contact_manger/features/contact_list/presentation/controller/contact_controller.dart';
import 'package:contact_manger/features/home/presentation/controller/home_controller.dart';
import 'package:contact_manger/features/task/data/dataSources/remot/task_server.dart';
import 'package:contact_manger/features/task/data/task_repository.dart';
import 'package:contact_manger/features/task/domain/usecases/get_task.dart';
import 'package:contact_manger/features/task/presentation/controller/contact_list_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ContactListMobileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(Dio());
    Get.put(DioHttpClient(dio:Get.find() ));

    Get.put(ContactsLocalDataSourceImpl());
    Get.put(ContactsRepositoryImpl(localDataSource: Get.find()));
    Get.put(GetContacts(Get.find<ContactsRepositoryImpl>()));
    Get.put(ContactsController(getContacts: Get.find()));

    Get.put(CallLogLocalDataSourceImpl());
    Get.put(CallLogRepositoryImp(callLogs: Get.find()));
    Get.put(GetCallLogs(Get.find<CallLogRepositoryImp>()));
    Get.put(CallLogController(getCallLogs: Get.find()));

    Get.put(TaskServerDataSourceImp(dioHttpClient:Get.find() ));
    Get.put(TaskRepositoryImp( taskServerDataSourceImp: Get.find()));
    Get.put(GetTask(repository: Get.find<TaskRepositoryImp>()));
    Get.put(TaskController(getTask: Get.find()));

    Get.put(HomeController());
  }
}
