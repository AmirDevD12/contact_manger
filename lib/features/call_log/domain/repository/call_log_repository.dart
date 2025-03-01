import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/features/call_log/domain/entity/call_log_entity.dart';
import 'package:either_dart/either.dart';

abstract class CallLogRepository {
  Future<Either<Failure, List<CallLogEntity>>> getCallLogs();
}