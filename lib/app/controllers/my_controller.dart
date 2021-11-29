import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_repository/app/utills/constants/key/mykey.dart';

class MyController extends GetxController {
  final getStorage = GetStorage();

  void changeLanguage(String code, String value) {
    var locale = Locale(code);

    Get.updateLocale(locale);
    getStorage.write(MyKey.language, value);
    Get.back();
  }

  void changeTheme(ThemeMode mode, bool value) {
    Get.changeThemeMode(mode);

    getStorage.write(MyKey.darkMode, value);
    Get.back();
  }
}
