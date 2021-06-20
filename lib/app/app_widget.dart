import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'components/screen/home/home_screen.dart';
import 'utills/constants/key/mykey.dart';
import 'utills/translations/mytranslation.dart';

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
    bool isDark = getStorage.read("darkMode") ?? false;
    String code = getStorage.read(MyKey.language) ?? "en";

    return GetMaterialApp(
      translations: MyTranslation(),
      locale: code == "en" ? Locale("en") : Locale("id"),
      theme: ThemeData(primaryColor: Colors.green),
      darkTheme: ThemeData.dark(),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(),
    );
  }
}