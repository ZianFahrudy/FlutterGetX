import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_repository/app/utills/translations/localization.dart';
import 'package:getx_repository/generated/locales.g.dart';

import 'components/screen/home/home_screen.dart';
import 'utills/constants/key/mykey.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  GetStorage getStorage = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = getStorage.read(MyKey.darkMode) ?? false;
    String code = getStorage.read(MyKey.language) ?? 'en';
    return GetMaterialApp(
      translations: AppLocalization(),
      translationsKeys: AppTranslation.translations,
      locale: code == AppLocalization.langs[0]
          ? AppLocalization.locale[0]
          : AppLocalization.locale[1],
      fallbackLocale: AppLocalization.fallbackLocale,
      theme: ThemeData(primaryColor: Colors.green),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
