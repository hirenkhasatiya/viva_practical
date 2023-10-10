import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_practical/controller/country_controller.dart';
import 'package:viva_practical/views/screens/Splash_screen.dart';
import 'package:viva_practical/views/screens/detail_page.dart';
import 'package:viva_practical/views/screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => countryController(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: "Splash_Screen",
      routes: {
        '/': (context) => HomePage(),
        'Splash_Screen': (context) => SplashScreen(),
        'Detail_Screen': (context) => DetailPage(),
      },
    );
  }
}
