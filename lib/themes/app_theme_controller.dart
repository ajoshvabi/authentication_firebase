import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  static ThemeService get to => Get.find();

  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  ThemeMode get theme => _themeMode.value;

  void toggleTheme() {
    _themeMode.value =
        _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(_themeMode.value);
  }
}
