import 'package:hive_flutter/adapters.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String phone;
  @HiveField(2)
  final String task;

  TaskModel({required this.name, required this.phone, required this.task});

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      name: map['name'],
      phone: map['phone'],
      task: map['task'],
    );
  }

  factory TaskModel.fromTask(TaskModel task) {
    return TaskModel(name: task.name, phone: task.phone, task: task.task);
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
