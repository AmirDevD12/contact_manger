import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure?, T>> call(P params);
}

class NoParams {}
