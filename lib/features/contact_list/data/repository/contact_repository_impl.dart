

import 'package:contact_manger/core/error_dartz/failures.dart';
import 'package:contact_manger/core/error_handling/app_exception.dart';
import 'package:contact_manger/features/contact_list/data/data_sources/local/contact_local.dart';
import 'package:contact_manger/features/contact_list/domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/domain/repository/contact_repository.dart';
import 'package:either_dart/either.dart';


class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsLocalDataSourceImpl localDataSource;

  ContactsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure?, List<Contact>>> getContacts(String query) async {
    try {
      final localContacts = await localDataSource.getContacts(query);
      List<Contact> contactList =
      localContacts.map((model) => Contact(displayName: model.displayName, phoneNumber: model.phoneNumber)).toList();
      return Right(
          contactList);
    } on LocalException {
      return Left(GeneralFailure("error", "error fetch"));
    }
  }
}
