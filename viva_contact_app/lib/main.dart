import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva_contact_app/Helpers/db_helper.dart';
import 'package:viva_contact_app/Helpers/fb_helper.dart';
import 'package:viva_contact_app/views/screens/homepage.dart';
import 'package:viva_contact_app/views/screens/splash_screen.dart';

import 'Controller/db_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DbHelper.dbhelper.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
