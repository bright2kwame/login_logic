import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:typical_login_logic/onboard/login_page.dart';
import 'package:typical_login_logic/onboard/register_page.dart';
import 'package:typical_login_logic/util/app_button_style.dart';
import 'package:typical_login_logic/util/app_resource.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppResource.primaryColor,
      ),
      body: Container(
        color: AppResource.primaryColor,
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(AppResource.onboardImage,
                  semanticsLabel: 'Welcome To Meo'),
            )),
            Container(
              height: 400,
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 64, bottom: 64, left: 32, right: 32),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    AppResource.appName,
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Start counting the calories and get healthier with our help.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 44,
                    decoration: AppButtonStyle()
                        .boxDecoration(context, 22, AppResource.primaryColor),
                    margin: const EdgeInsets.only(top: 32, bottom: 16),
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {
                          _navigateToLogin();
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Container(
                    height: 44,
                    decoration: AppButtonStyle()
                        .boxDecoration(context, 22, Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {
                          _navigateToRegister();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: AppResource.primaryColor),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void _navigateToRegister() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
  }
}
