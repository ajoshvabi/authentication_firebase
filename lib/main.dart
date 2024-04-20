import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jet/features/auth/auth_controllers/authentication_controller.dart';
import 'package:jet/firebase_options.dart';
import 'package:jet/features/auth/views/splash_page.dart';
import 'package:jet/routes/page_routes.dart';
import 'package:jet/themes/app_theme.dart';
import 'package:jet/themes/app_theme_controller.dart';

void main() {
  Get.put(ThemeService());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationController()));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeService.to.theme,
      home: const Splash(),
    );
  }
}
