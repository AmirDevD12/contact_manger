import 'dart:async';

import 'package:contact_manger/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class saveSharedPreferences {
  late SharedPreferences sharedPreferences;

  saveSharedPreferences () {
    sharedPreferences = getIt<SharedPreferences>();
  }
  saveLengthLog(int length) async {
    sharedPreferences.setInt("length", length);
  }

  Future load() async {
    final length =sharedPreferences.getInt("length");
    if(length != null){
      return length;
    }
    return -1;
  }

  Future<void> delete() async {
    sharedPreferences.clear();
  }
}
