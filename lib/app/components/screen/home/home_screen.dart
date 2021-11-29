import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_repository/app/components/widgets/drawer/mydrawer.dart';
import 'package:getx_repository/app/controllers/my_controller.dart';
import 'package:getx_repository/app/utills/constants/key/mykey.dart';
import 'package:getx_repository/app/utills/constants/translations/translations_constants.dart';

enum ThemeBrightness { Light, Dark }

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyController controller = Get.put(MyController());

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
    bool isDarkmode = getStorage.read(MyKey.darkMode) ?? false;
    String languageCode = getStorage.read(MyKey.language) ?? "en";

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Getx Impl Example",
          ),
        ),
        body: Center(
          child: Text(Trconts.helloWorld.tr),
        ),
        drawer: MyDrawer(
          widget: Column(
            children: [
              buildListTileChangeTheme(context, isDarkmode, controller),
              buildListTileChangeLanguage(context, languageCode, controller),
            ],
          ),
        ));
  }

  Widget buildListTileChangeLanguage(
      BuildContext context, String languageCode, MyController controller) {
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
                              onChanged: (value) {
                                languageCode = value!;
                                controller.changeLanguage('en', value);
                              }),
                          RadioListTile<String>(
                              dense: false,
                              title: Text("Indonesia"),
                              value: "id",
                              groupValue: languageCode,
                              onChanged: (value) {
                                languageCode = value!;
                                controller.changeLanguage('id', value);
                              }),
                        ],
                      ),
                    ));
          },
        ),
      ],
    );
  }

  Widget buildListTileChangeTheme(
      BuildContext context, bool isDarkmode, MyController controller) {
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
                              onChanged: (value) {
                                isDarkmode = value!;
                                controller.changeTheme(ThemeMode.light, value);
                              }),
                          RadioListTile<bool>(
                              dense: false,
                              title: Text("Dark"),
                              value: true,
                              groupValue: isDarkmode,
                              onChanged: (value) {
                                isDarkmode = value!;
                                controller.changeTheme(ThemeMode.dark, value);
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
