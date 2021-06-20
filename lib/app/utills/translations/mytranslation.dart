import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'helloWord': "Hello Word",
          'changeTheme': 'Change Theme',
          'changeLanguage': 'Change Language'
        },
        'id': {
          'helloWord': "Hallo Dunia",
          'changeTheme': 'Ganti Tema',
          'changeLanguage': 'Ganti Bahasa'
        }
      };
}
