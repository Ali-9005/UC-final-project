import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techy/SplashPage.dart';
void main() async {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage());
  }
}
