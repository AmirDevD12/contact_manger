import 'package:contact_manger/features/contact_list/data/models/contact_local_model.dart';
import 'package:contacts_service/contacts_service.dart';


abstract class ContactsLocalDataSource {
  Future<List<ContactLocalModel>> getContacts();
}

class ContactsLocalDataSourceImpl implements ContactsLocalDataSource {
  @override
  Future<List<ContactLocalModel>> getContacts() async {
    final contacts = await ContactsService.getContacts();
    return contacts.map((contact) => ContactLocalModel.fromContact(contact)).toList();
  }
}
