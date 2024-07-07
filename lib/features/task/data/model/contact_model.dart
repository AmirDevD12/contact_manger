import 'package:hive_flutter/adapters.dart';
part 'contact_model.g.dart';
@HiveType(typeId: 1)
class ContactModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String phone;
  @HiveField(2)
  final String task;
  ContactModel({required this.name,required this.phone,required this.task});
  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'],
      phone: map['phone'],
      task: map['task'],
    );
  }

  // Method to convert a Contact to a map (e.g., for JSON serialization)
   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'task': task,
    };
  }
}