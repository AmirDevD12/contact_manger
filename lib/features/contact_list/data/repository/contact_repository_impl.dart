

import 'package:contact_manger/core/error_handling/app_exception.dart';
import 'package:contact_manger/features/contact_list/data/data_sources/local/contact_local.dart';
import 'package:contact_manger/features/contact_list/domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/domain/repository/contact_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_dartz/failures.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsLocalDataSourceImpl localDataSource;

  ContactsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Contact>>> getContacts() async {
    try {
      final localContacts = await localDataSource.getContacts();
      List<Contact> contactList =
      localContacts.map((model) => Contact(displayName: model.displayName, phoneNumber: model.phoneNumber)).toList();
      return Right(
          contactList);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
