import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva_contact_app/Helpers/db_helper.dart';
import 'package:viva_contact_app/views/screens/backup_page.dart';
import 'package:viva_contact_app/views/screens/contact_detail.dart';
import 'package:viva_contact_app/views/screens/homepage.dart';
import 'package:viva_contact_app/views/screens/splash_screen.dart';

import 'Controller/theme_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DbHelper.dbHelper.initDb();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());

    return Obx(() {
      return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        themeMode:
            themeController.isLight.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/home': (context) => const HomePage(),
          '/detail': (context) => const DetailPage(),
          '/backup': (context) => const BackupPage(),
        },
      );
    });
  }
}
