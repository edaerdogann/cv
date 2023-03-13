import 'package:flutter/material.dart';
import 'package:my_cv/size_config.dart';

const primaryColor = Color(0xFF4F4FEC);
const secondaryColor = Color(0xFF7B8794);
const backgroundColor = Color(0xFFF8F8FB);
const textColor = Color(0xFF062743);

const animationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Color(0xFF111821),
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please enter your email";
const String invalidEmailError = "Please enter a valid email";
const String passNullError = "Please enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords don't match";
const String nameNullError = "Please enter your name";
const String occupationNullError = "Please enter your occupation";

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: textColor),
  );
}