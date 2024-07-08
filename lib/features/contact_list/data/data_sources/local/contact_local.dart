import 'package:contact_manger/features/contact_list/data/models/contact_local_model.dart';
import 'package:contacts_service/contacts_service.dart';

abstract class ContactsLocalDataSource {
  Future<List<ContactLocalModel>> getContacts(String query);
}

class ContactsLocalDataSourceImpl implements ContactsLocalDataSource {
  @override
  Future<List<ContactLocalModel>> getContacts(String query) async {
    final contacts = await ContactsService.getContacts(query: query);

    return contacts
        .map((contact) => ContactLocalModel.fromContact(contact))
        .toList();
  }
}
