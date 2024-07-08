import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/core/error_handling/app_exception.dart';
import 'package:contact_manger/features/call_log/data/data_sorce/local/call_log_local.dart';
import 'package:contact_manger/features/call_log/domain/entity/call_log_entity.dart';
import 'package:contact_manger/features/call_log/domain/repository/call_log_repository.dart';
import 'package:either_dart/either.dart';

class CallLogRepositoryImp implements CallLogRepository {

  final CallLogLocalDataSourceImpl callLogs;

  CallLogRepositoryImp({required this.callLogs});

  @override
  Future<Either<Failure, List<CallLogEntity>>> getCallLogs() async {
    try {
      final callLogModel = await callLogs.getCallLogs();
      List<CallLogEntity> callLogsEntries = callLogModel
          .map((model) => CallLogEntity(
              name: model.name,
              number: model.number,
              callType: model.callType,
              dateTime: model.dateTime,
              duration: model.duration))
          .toList();
      return Right(callLogsEntries);
    } on LocalException {
      return Left(GeneralFailure("error", "error fetch"));
    }
  }
}
