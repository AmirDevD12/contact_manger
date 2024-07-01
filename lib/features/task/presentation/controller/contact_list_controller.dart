import 'package:contact_manger/features/call_log/data/models/contact_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class TaskController extends GetxController {
  var contacts = <ContactModel>[].obs;
  final box = Hive.box<ContactModel>('contactsBox');

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  Future<void> fetchContacts() async {
    contacts.value = box.values.toList();
  }

  Future<void> addContact(ContactModel contact) async {
    await box.add(contact);
    contacts.add(contact); // Update the observable list
  }
  removeItemBox(int index){
    box.deleteAt(index);
    fetchContacts();

  }
}
