import 'package:flutter/material.dart';
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
            Expanded(child: Container()),
            Container(
              height: 400,
              color: Colors.white,
              padding:
                  EdgeInsets.only(top: 64, bottom: 64, left: 32, right: 32),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    AppResource.appName,
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Start counting the calories and get healthier with our help.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                        color: AppResource.primaryColor,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    margin: EdgeInsets.only(top: 32, bottom: 16),
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppResource.primaryColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {},
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
}
