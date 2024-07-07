import 'package:call_log/call_log.dart';
import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/core/usecase/usecase.dart';
import 'package:contact_manger/features/call_log/domain/entity/call_log_entity.dart';
import 'package:contact_manger/features/call_log/domain/repository/call_log_repository.dart';
import 'package:dartz/dartz.dart';

 class GetCallLogs implements UseCase<List<CallLogEntity>, NoParams> {
  final CallLogRepository repository;
  GetCallLogs(this.repository);
  @override
  Future<Either<Failure, List<CallLogEntity>>> call(NoParams params) async {
    return await repository.getCallLogs();
  }
}