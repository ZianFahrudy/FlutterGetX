import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'helloWorld': 'Hello World',
          'changeTheme': 'Change Theme',
          'changeLanguage': 'Change Language'
        },
        'id': {
          'helloWorld': 'Hallo Dunia',
          'changeTheme': 'Ganti Tema',
          'changeLanguage': 'Ganti Bahasa'
        }
      };
}
