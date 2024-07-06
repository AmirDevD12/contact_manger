
import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/features/contact_list/Domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/Domain/repository/contact_repository.dart';
import 'package:contact_manger/features/contact_list/data/data_sources/local/contact_local.dart';
import 'package:contact_manger/features/contact_list/data/models/contact_model.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dartz/dartz.dart';


class ContactRepositoryImpl implements ContactRepository {
  @override
  Future<Either<Failure, List<ContactEntity>>> fetchContacts() async {
    try {
      Iterable<Contact> contacts =await ContactService().getContacts();
      List<ContactModelLocal> contactModels = contacts.map((contact) => ContactModelLocal.fromContactService(contact)).toList();
      return Right(contactModels);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
