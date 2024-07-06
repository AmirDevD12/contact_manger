import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/features/contact_list/Domain/entity/contact_entity.dart';
import 'package:dartz/dartz.dart';


abstract class ContactRepository {
  Future<Either<Failure, List<ContactEntity>>> fetchContacts();
}
