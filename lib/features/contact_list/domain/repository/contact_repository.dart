import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/features/contact_list/domain/entity/contact_entity.dart';
import 'package:either_dart/either.dart';


abstract class ContactsRepository {
  Future<Either<Failure?, List<Contact>>> getContacts(String query);
}
