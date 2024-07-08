import 'package:contact_manger/core/theme/theme_defult.dart';
import 'package:contact_manger/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/constants/routings.dart';
import 'features/task/data/model/task_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>("contactsBox");
  await Hive.openBox<TaskModel>("contactSend");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      getPages: AppRouting().pages(),
      initialRoute: AppRouting().permission,
    );
  }
}
