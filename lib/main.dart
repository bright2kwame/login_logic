import 'package:flutter/material.dart';
import 'package:typical_login_logic/model/db_operation.dart';
import 'package:typical_login_logic/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var users = await DBOperations().users();
  runApp(MyApp(
    isLoggedIn: users.isNotEmpty,
  ));
}
