
import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/core/usecase/usecase.dart';
import 'package:contact_manger/features/contact_list/Domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/Domain/repository/contact_repository.dart';

import 'package:dartz/dartz.dart';

class FetchContacts implements UseCase<List<ContactEntity>, NoParams> {
  final ContactRepository repository;

  FetchContacts(this.repository);

  @override
  Future<Either<Failure, List<ContactEntity>>> call(NoParams params) async {
    return await repository.fetchContacts();
  }
}

class NoParams {}
