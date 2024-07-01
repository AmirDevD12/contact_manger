
import 'package:contact_manger/features/contact_list/presentation/binding/contact_list_mobile_binding.dart';
import 'package:contact_manger/features/contact_list/presentation/widgets/home.dart';
import 'package:contact_manger/features/contact_list/presentation/widgets/permisiion.dart';
import 'package:get/get.dart';

class Routings {
  static final Routings _singleton = Routings._internal();

  factory Routings() => _singleton;

  Routings._internal();

  final home = '/home';
  final permission = '/permission';
  final settings = '/settings';

  List<GetPage> pages() => [
    GetPage(
      name: "/permission",
      page: () => const PermissionsScreen(),),
        GetPage(
            name: "/home",
            page: () => Home(),
            binding: ContactListMobileBinding()),

      ];
}
