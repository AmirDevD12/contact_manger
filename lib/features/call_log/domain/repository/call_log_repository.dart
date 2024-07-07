import 'package:call_log/call_log.dart';
import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/features/call_log/domain/entity/call_log_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CallLogRepository {
  Future<Either<Failure, List<CallLogEntity>>> getCallLogs();
}