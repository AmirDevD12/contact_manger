
import 'package:contact_manger/features/contact_list/presentation/binding/contact_list_mobile_binding.dart';
import 'package:contact_manger/features/home/presentation/home.dart';
import 'package:contact_manger/features/permission/presentation/permisiion.dart';
import 'package:get/get.dart';

class AppRouting {
  static final AppRouting _singleton = AppRouting._internal();

  factory AppRouting() => _singleton;

  AppRouting._internal();

  final home = '/home';
  final permission = '/permission';
  final settings = '/settings';

  List<GetPage> pages() => [
    GetPage(
      name: "/permission",
      page: () => const PermissionsScreen(),),
        GetPage(
            name: "/home",
            page: () => const Home(),
            binding: ContactListMobileBinding()),

      ];
}
