import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/core/usecase/usecase.dart';
import 'package:contact_manger/features/contact_list/domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/domain/repository/contact_repository.dart';
import 'package:dartz/dartz.dart';


class GetContacts implements UseCase<List<Contact>, NoParams> {
  final ContactsRepository repository;

  GetContacts(this.repository);

  @override
  Future<Either<Failure, List<Contact>>> call(NoParams params) async {
    return await repository.getContacts();
  }
}
