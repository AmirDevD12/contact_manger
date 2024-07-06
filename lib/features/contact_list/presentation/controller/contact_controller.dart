import 'package:contact_manger/features/contact_list/Domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/Domain/use_cases/fetch_contacts.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final FetchContacts fetchContacts;

  ContactController(this.fetchContacts);

  var contacts = <ContactEntity>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadContacts();
  }

  void loadContacts() async {
    isLoading(true);
    final failureOrContacts = await fetchContacts(NoParams());
    failureOrContacts.fold(
          (failure) {
        errorMessage('Error fetching contacts');
      },
          (contactList) {
        contacts(contactList);
      },
    );
    isLoading(false);
  }
}
