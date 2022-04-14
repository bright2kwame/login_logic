import 'package:flutter/material.dart';
import 'package:typical_login_logic/util/app_text_style.dart';

class AppInputDecoration {
  InputDecoration boxDecoration(String hintLabel) {
    return InputDecoration(
      fillColor: Colors.transparent,
      enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          borderSide: BorderSide(color: Colors.white)),
      border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          borderSide: BorderSide(color: Colors.white)),
      focusedBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          borderSide: BorderSide(color: Colors.white)),
      filled: false,
      labelStyle: AppTextStyle().textStyle(Colors.white, 16),
      hintStyle: AppTextStyle().textStyle(Colors.white, 16),
      contentPadding:
          const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      labelText: hintLabel,
    );
  }
}
