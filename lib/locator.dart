import 'package:call_log/call_log.dart';
import 'package:contact_manger/core/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/call_log/data/data_sorce/local/shared_preferences.dart';
final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<CallLog>(CallLog());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<saveSharedPreferences>(saveSharedPreferences());
  getIt.registerSingleton<DioHttpClient>(DioHttpClient(dio: getIt<Dio>()));


}