

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:contacts_service/contacts_service.dart';

part 'contact_local_model.freezed.dart';
part 'contact_local_model.g.dart';
@freezed
class ContactLocalModel with _$ContactLocalModel {
  factory ContactLocalModel({
    required String displayName,
    required String phoneNumber,
  }) = _ContactLocalModel;

  factory ContactLocalModel.fromJson(Map<String, dynamic> json) => _$ContactLocalModelFromJson(json);

  factory ContactLocalModel.fromContact(Contact contact) {
    return ContactLocalModel(
      displayName: contact.displayName ?? '',
      phoneNumber: contact.phones!.isNotEmpty ? contact.phones!.first.value! : '',
    );
  }
}
