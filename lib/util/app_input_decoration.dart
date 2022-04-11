import 'package:flutter/material.dart';

class AppInputDecoration {
  InputDecoration boxDecoration(String hintLable) {
    return InputDecoration(
      fillColor: Colors.transparent,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.white)),
      filled: true,
      contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      labelText: hintLable,
    );
  }
}
