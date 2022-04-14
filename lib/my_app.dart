import 'package:flutter/material.dart';
import 'package:typical_login_logic/home/home_page.dart';
import 'package:typical_login_logic/onboard/login_page.dart';
import 'package:typical_login_logic/onboard/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Now',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}
