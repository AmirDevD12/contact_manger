import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/core/usecase/usecase.dart';
import 'package:contact_manger/features/contact_list/domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/domain/repository/contact_repository.dart';
import 'package:either_dart/either.dart';


class GetContacts implements UseCase<List<Contact>,String> {
  final ContactsRepository repository;

  GetContacts(this.repository);

  @override
  Future<Either<Failure?, List<Contact>>> call(String query) async {
    return  repository.getContacts(query);
  }
}
