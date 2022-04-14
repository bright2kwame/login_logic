import 'package:flutter/material.dart';
import 'package:typical_login_logic/home/home_page.dart';
import 'package:typical_login_logic/model/db_operation.dart';
import 'package:typical_login_logic/model/manage_database.dart';
import 'package:typical_login_logic/model/user_item.dart';
import 'package:typical_login_logic/onboard/login_page.dart';
import 'package:typical_login_logic/util/app_button_style.dart';
import 'package:typical_login_logic/util/app_input_decoration.dart';
import 'package:typical_login_logic/util/app_resource.dart';
import 'package:typical_login_logic/util/app_text_style.dart';
import 'package:typical_login_logic/util/popup_views.dart';
import 'package:typical_login_logic/util/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //MARK: editing controller fields
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _passwordConfirmTextEditingController =
      TextEditingController();

  final TextEditingController _firstNameConfirmTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppResource.onboardBgImage),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: AppResource.primaryColor.withAlpha(1000),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.all(16),
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
                    "Sign up",
                    style: AppTextStyle().textStyle(Colors.white, 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: AppTextStyle().textStyle(Colors.white, 16),
                    controller: _firstNameConfirmTextEditingController,
                    decoration:
                        AppInputDecoration().boxDecoration("First name"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: AppTextStyle().textStyle(Colors.white, 16),
                    controller: _lastNameTextEditingController,
                    decoration: AppInputDecoration().boxDecoration("Last name"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: TextFormField(
                    validator: (value) =>
                        Validator().isValidEmail(value.toString())
                            ? ""
                            : "Enter a valid email",
                    keyboardType: TextInputType.emailAddress,
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
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: AppTextStyle().textStyle(Colors.white, 16),
                      controller: _passwordConfirmTextEditingController,
                      decoration: AppInputDecoration()
                          .boxDecoration("Re-enter password"),
                    )),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 0.0),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {
                        _handleTermsAndConditions();
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'By continuing, you agree to our',
                                style:
                                    AppTextStyle().textStyle(Colors.white, 16)),
                            TextSpan(
                                text: ' Terms of Service',
                                style:
                                    AppTextStyle().textStyle(Colors.green, 16)),
                            TextSpan(
                                text: ' and ',
                                style:
                                    AppTextStyle().textStyle(Colors.white, 16)),
                            TextSpan(
                                text: ' Privacy Policy',
                                style:
                                    AppTextStyle().textStyle(Colors.green, 16)),
                          ],
                        ),
                      )),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 0.0),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      AppButtonStyle().boxDecoration(context, 22, Colors.white),
                  child: TextButton(
                      onPressed: () {
                        _handleRegisterInput();
                      },
                      child: Text(
                        "Sign Up",
                        style: AppTextStyle()
                            .textStyle(AppResource.primaryColor, 16),
                      )),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      _navigateToLogin();
                    },
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Already have an acount? ',
                              style:
                                  AppTextStyle().textStyle(Colors.white, 16)),
                          TextSpan(
                              text: ' Login',
                              style:
                                  AppTextStyle().textStyle(Colors.green, 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }

  //MARK: go to the terms and conditions page
  void _handleTermsAndConditions() {}

  //MARK: navigate to the login screen
  void _navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  //MARK: handle the creating user action
  _handleRegisterInput() async {
    String email = _emailTextEditingController.text.trim();
    String password = _passwordTextEditingController.text.trim();
    String passwordConfirm = _passwordConfirmTextEditingController.text.trim();
    String firstName = _firstNameConfirmTextEditingController.text.trim();
    String lastName = _lastNameTextEditingController.text.trim();

    //MARK: valid name
    if (!Validator().isValidName(firstName) ||
        !Validator().isValidName(lastName)) {
      PopUpViews().showAlertDialog(
          context: context,
          title: AppResource.appName,
          content:
              "We see the provided name as invalid. Please provide a valid name and proceed.",
          defaultActionText: "OK");
      return;
    }

    //MARK: valid email address provided
    if (!Validator().isValidEmail(email)) {
      PopUpViews().showAlertDialog(
          context: context,
          title: AppResource.appName,
          content: "Email address appears to be invalid.",
          defaultActionText: "OK");
      return;
    }

    //MARK: password not matching
    if (password.isEmpty ||
        passwordConfirm.isEmpty ||
        password != passwordConfirm) {
      PopUpViews().showAlertDialog(
          context: context,
          title: AppResource.appName,
          content: "Passwords do not match, check and try again.",
          defaultActionText: "OK");
      return;
    }

    //MARK: create user id
    var userId = DateTime.now().millisecond.toString();
    String fullName = lastName + " " + firstName;
    //MARK: create user item
    UserItem userItem = UserItem(
        id: userId,
        firstName: firstName,
        lastName: lastName,
        fullName: fullName,
        email: email);
    //MARK: create a db instance and insert item
    await DBOperations().insertUser(userItem);

    _navigateHome();
  }

  //MARK: navigate to the home screen popping all other screens
  void _navigateHome() {
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const MyHomePage(),
      ),
      (route) => false,
    );
  }
}
