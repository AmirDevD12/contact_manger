import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:dartz/dartz.dart';

import '../entity/contact_entity.dart';

abstract class ContactsRepository {
  Future<Either<Failure, List<Contact>>> getContacts();
}
