import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactService {
  Future<bool> requestPermissions() async {
    var status = await Permission.contacts.status;
    if (!status.isGranted) {
      status = await Permission.contacts.request();
    }
    return status.isGranted;
  }

  Future<Iterable<Contact>> getContacts() async {
    if (await requestPermissions()) {
      return await ContactsService.getContacts();
    } else {
      throw Exception("Contacts permission not granted");
    }
  }

}