import 'package:flutter/widgets.dart';

import 'package:my_cv/screens/details/details_screen.dart';
import 'package:my_cv/wrapper.dart';
import 'package:my_cv/screens/forgot_password/forgot_password_screen.dart';
import 'package:my_cv/screens/home/home_screen.dart';
import 'package:my_cv/screens/sign_in/sign_in_screen.dart';
import 'package:my_cv/screens/sign_up/sign_up_screen.dart';
import 'package:my_cv/screens/splash/splash_screen.dart';
import 'package:my_cv/screens/saved/saved_screen.dart';
import 'package:my_cv/screens/use_template/use_template.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Wrapper.routeName: (context) => Wrapper(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  SavedScreen.routeName: (context) => SavedScreen(),
  UseTemplateScreen.routeName: (context) => UseTemplateScreen(),
};