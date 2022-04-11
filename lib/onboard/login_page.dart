import 'package:flutter/material.dart';
import 'package:typical_login_logic/home/home_page.dart';
import 'package:typical_login_logic/util/app_input_decoration.dart';
import 'package:typical_login_logic/util/app_resource.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool _startLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppResource.primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: AppResource.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppResource.appName),
            Text("Welcome Back!"),
            SizedBox(
              height: 64,
            ),
            TextField(
              controller: _emailTextEditingController,
              decoration: AppInputDecoration().boxDecoration("Email"),
            ),
            TextField(
              controller: _passwordTextEditingController,
              decoration: AppInputDecoration().boxDecoration("Password"),
            ),
             _startLoading ? CircularProgressIndicator() : Container(),
            Container(
              width: 300,
              color: _startLoading ? Colors.grey : Colors.green,
              child: TextButton(
                  onPressed: () {
                    handleLoginInput();
                  },
                  child: Text("Login")),
            )
          ],
        ),
      ),
    );
  }

  void handleLoginInput() {
    String email = _emailTextEditingController.text.trim();
    String password = _passwordTextEditingController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    setState(() {
      _startLoading = true;
    });
    
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const MyHomePage(),
      ),
      (route) => false,
    );
    
  }
}
