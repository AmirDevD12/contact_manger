import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:either_dart/either.dart';

abstract class TaskRepository{
  Future<Either<Failure?,List<dynamic>>> getTask();
}