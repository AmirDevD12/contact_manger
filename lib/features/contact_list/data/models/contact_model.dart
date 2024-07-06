
import 'package:contact_manger/features/contact_list/Domain/entity/contact_entity.dart';

class ContactModelLocal extends ContactEntity {
  ContactModelLocal({required String displayName, required String phoneNumber})
      : super(displayName: displayName, phoneNumber: phoneNumber);

  factory ContactModelLocal.fromContactService(contact) {
    return ContactModelLocal(
      displayName: contact.displayName ?? '',
      phoneNumber: contact.phones?.isNotEmpty == true ? contact.phones!.first.value ?? '' : '',
    );
  }
}
