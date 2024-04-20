import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 0, 0, 0),
    onPrimary: Color.fromARGB(255, 0, 0, 0),
    secondary: Color.fromARGB(255, 242, 108, 74),
  ),
  scaffoldBackgroundColor: Colors.white,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 242, 242, 242),
    onPrimary: Color.fromARGB(255, 242, 242, 242),
    secondary: Color.fromARGB(255, 255, 255, 255),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 14, 14, 14),
);
