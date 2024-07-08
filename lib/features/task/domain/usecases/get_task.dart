import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/core/usecase/usecase.dart';
import 'package:contact_manger/features/task/domain/repository/task_repository.dart';
import 'package:either_dart/either.dart';

class GetTask extends UseCase<List<dynamic>, NoParams> {
  final TaskRepository repository;

  GetTask({required this.repository});

  @override
  Future<Either<Failure?, List<dynamic>>> call(NoParams params) {
    return repository.getTask();
  }
}