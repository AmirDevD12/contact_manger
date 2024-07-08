import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/core/network/check_network.dart';
import 'package:contact_manger/features/task/data/model/task_model.dart';
import 'package:contact_manger/features/task/domain/repository/task_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';

import 'dataSources/remot/task_server.dart';

class TaskRepositoryImp implements TaskRepository{
  final TaskServerDataSourceImp taskServerDataSourceImp;
  TaskRepositoryImp({required this.taskServerDataSourceImp});
  @override
  Future<Either<Failure?, List>> getTask() async {
    // TODO: implement getTask
    try {
      bool connection = await NetworkInfoRepositoryImpl().hasConnection;
      List<TaskModel> response;
      if (connection) {
        response = await taskServerDataSourceImp.getTask();
        return Right(response);

      }else {
       return const Right([]);
      }
    } on DioException catch (e) {
      return Left(GeneralFailure(
          "error", e.response != null ? e.response!.data["body"] : "please check your network"));
    }  }

}