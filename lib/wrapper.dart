import 'package:flutter/material.dart';
import 'package:my_cv/screens/sign_in/sign_in_screen.dart';
import 'package:provider/provider.dart';

import 'package:my_cv/screens/home/home_screen.dart';
import 'package:my_cv/models/user.dart';

class Wrapper extends StatelessWidget {
  static String routeName = "/wrapper";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<newUser>(context);
    if (user == null) {
      return SignInScreen();
    } else {
      return HomeScreen();
    }
  }
}