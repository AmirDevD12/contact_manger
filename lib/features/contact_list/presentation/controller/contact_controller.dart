import 'package:contact_manger/core/usecase/usecase.dart';
import 'package:contact_manger/features/contact_list/domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/domain/usecases/fetch_contacts.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController with StateMixin<List<Contact>> {
  final GetContacts getContacts;

  ContactsController({required this.getContacts});

  @override
  void onInit() {
    fetchContacts();
    super.onInit();
  }

  void fetchContacts() async {
    change(null, status: RxStatus.loading());
    final result = await getContacts(NoParams());
    result.fold(
      (failure) =>
          change(null, status: RxStatus.error('Error fetching contacts')),
      (contacts) => change(contacts, status: RxStatus.success()),
    );
  }
}
