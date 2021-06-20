import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_repository/app/components/widgets/drawer/mydrawer.dart';
import 'package:getx_repository/app/utills/constants/key/mykey.dart';
import 'package:getx_repository/app/utills/constants/translations/translations_constants.dart';

enum ThemeBrightness { Light, Dark }

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeBrightness? theme;

  final getStorage = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// [optional] getStorage.writeIfNull("darkMode", false); [if not use null-aware operator]

    /// init value is [false]
    bool isDarkmode = getStorage.read("darkMode") ?? false;
    String languageCode = getStorage.read(MyKey.language) ?? "en";

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Getx Repository",
          ),
        ),
        body: Center(
          child: Text(Trconts.helloWord.tr),
        ),
        drawer: MyDrawer(
          widget: Column(
            children: [
              buildListTileChangeTheme(context, isDarkmode),
              buildListTileChangeLanguage(context, languageCode),
            ],
          ),
        ));
  }

  Widget buildListTileChangeLanguage(
      BuildContext context, String languageCode) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.language),
          title: Text(
            Trconts.changeLanguage.tr,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                        Trconts.changeLanguage.tr,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile<String>(
                              dense: false,
                              title: Text("English"),
                              value: "en",
                              groupValue: languageCode,
                              onChanged: (v) {
                                setState(() {
                                  languageCode = v!;
                                  Get.updateLocale(Locale("en"));
                                  getStorage.write(MyKey.language, v);
                                  // getStorage.write("darkMode", v);
                                  // prefs!.putBool("zian", false);
                                });
                              }),
                          RadioListTile<String>(
                              dense: false,
                              title: Text("Indonesia"),
                              value: "id",
                              groupValue: languageCode,
                              onChanged: (v) {
                                setState(() {
                                  languageCode = v!;
                                  Get.updateLocale(Locale("id"));
                                  getStorage.write(MyKey.language, v);
                                  // Get.changeThemeMode(ThemeMode.dark);
                                  // getStorage.write("darkMode", v);
                                });
                              }),
                        ],
                      ),
                    ));
          },
        ),
      ],
    );
  }

  Widget buildListTileChangeTheme(BuildContext context, bool isDarkmode) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.dark_mode,
          ),
          title: Text(
            Trconts.changeTheme.tr,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                        Trconts.changeTheme.tr,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile<bool>(
                              dense: false,
                              title: Text("Light"),
                              value: false,
                              groupValue: isDarkmode,
                              onChanged: (v) {
                                setState(() {
                                  isDarkmode = v!;
                                  Get.changeThemeMode(ThemeMode.light);
                                  getStorage.write("darkMode", v);
                                  // prefs!.putBool("zian", false);
                                });
                              }),
                          RadioListTile<bool>(
                              dense: false,
                              title: Text("Dark"),
                              value: true,
                              groupValue: isDarkmode,
                              onChanged: (v) {
                                setState(() {
                                  isDarkmode = v!;
                                  Get.changeThemeMode(ThemeMode.dark);
                                  getStorage.write("darkMode", v);
                                });
                              }),
                        ],
                      ),
                    ));
          },
        ),
      ],
    );
  }
}
