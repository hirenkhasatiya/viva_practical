import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ChangePage() {
    Timer.periodic(
      Duration(seconds: 4),
      (timer) {
        Navigator.of(context).pushReplacementNamed('/');
        timer.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    ChangePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 4,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("asset/images/tenor.gif"),
                        fit: BoxFit.cover)),
              ),
              const Spacer(),
              Text("Country App",
                  style: TextStyle(
                      color: Color(0xff3F72AF),
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const Spacer(
                flex: 3,
              )
            ],
          )),
      backgroundColor: Colors.white,
    );
  }
}
