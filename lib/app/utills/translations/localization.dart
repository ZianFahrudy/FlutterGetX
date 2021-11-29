import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_repository/generated/locales.g.dart';

class AppLocalization extends Translations {
  // Default locale
  static final locale = [Locale('en'), Locale('id')];

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('id');

  // Your supported language here
  static final langs = [
    'en',
    'id',
  ];

  // Supported locales (same order as above)
  static final locales = [
    Locale('en'),
    Locale('id'),
  ];

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;
}
