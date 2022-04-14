import 'package:flutter/material.dart';
import 'package:typical_login_logic/home/home_page.dart';
import 'package:typical_login_logic/util/app_button_style.dart';
import 'package:typical_login_logic/util/app_input_decoration.dart';
import 'package:typical_login_logic/util/app_resource.dart';
import 'package:typical_login_logic/util/app_text_style.dart';
import 'package:typical_login_logic/util/popup_views.dart';
import 'package:typical_login_logic/util/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool _startLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppResource.onboardBgImage),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppResource.primaryColor.withAlpha(1000),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            color: AppResource.primaryColor.withAlpha(1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(AppResource.appName,
                    style: AppTextStyle().textStyleBold(Colors.green, 34)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Text(
                    "Welcome Back!",
                    style: AppTextStyle().textStyle(Colors.white, 16),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: TextField(
                    style: AppTextStyle().textStyle(Colors.white, 16),
                    controller: _emailTextEditingController,
                    decoration: AppInputDecoration().boxDecoration("Email"),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: AppTextStyle().textStyle(Colors.white, 16),
                      controller: _passwordTextEditingController,
                      decoration:
                          AppInputDecoration().boxDecoration("Password"),
                    )),
                Row(
                  children: [
                    Expanded(child: Container()),
                    TextButton(
                        onPressed: () {
                          handleLoginInput();
                        },
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyle().textStyle(Colors.white, 14),
                        )),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 0.0),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      AppButtonStyle().boxDecoration(context, 22, Colors.white),
                  child: TextButton(
                      onPressed: () {
                        _startLoading ? null : handleLoginInput();
                      },
                      child: _startLoading
                          ? Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(
                                value: 0.8,
                              ))
                          : Text(
                              "Login",
                              style: AppTextStyle()
                                  .textStyle(AppResource.primaryColor, 16),
                            )),
                )
              ],
            ),
          ),
        ));
  }

  void handleLoginInput() {
    String email = _emailTextEditingController.text.trim();
    String password = _passwordTextEditingController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      PopUpViews().showAlertDialog(
          context: context,
          title: AppResource.appName,
          content: "Provide email and a password.",
          defaultActionText: "OK");
      return;
    }

    if (!Validator().isValidEmail(email)) {
      PopUpViews().showAlertDialog(
          context: context,
          title: AppResource.appName,
          content: "Provide a valid email address.",
          defaultActionText: "OK");
      return;
    }

    setState(() {
      _startLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _startLoading = false;
      });
      _navigateToHomeScreen();
    });
  }

  void _navigateToHomeScreen() {
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const MyHomePage(),
      ),
      (route) => false,
    );
  }
}
