import 'package:flutter/material.dart';
import 'package:typical_login_logic/util/app_resource.dart';

class AppButtonStyle {
  BoxDecoration boxDecoration(
      BuildContext context, double cornerRadius, Color bgColor) {
    return BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: AppResource.primaryColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)));
  }
}
