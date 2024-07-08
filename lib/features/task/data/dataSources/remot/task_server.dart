
import 'package:contact_manger/core/network/dio.dart';
import 'package:contact_manger/features/task/data/model/task_model.dart';
import 'package:dio/dio.dart';

abstract class TaskServerDataSource{
Future<List<TaskModel>> getTask();
}
class TaskServerDataSourceImp  implements TaskServerDataSource{
  final DioHttpClient dioHttpClient;
  TaskServerDataSourceImp({required this.dioHttpClient});
  @override
  Future<List<TaskModel>> getTask() async {
    // TODO: implement getTask
      final response = await dioHttpClient.get(
          "",{}, [], Options());

     final task =  response.to(()=>TaskModel.fromTask(response)).toList();
      return task??[];
  }
}