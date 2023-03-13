import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:my_cv/routes.dart';
import 'package:my_cv/screens/splash/splash_screen.dart';
import 'package:my_cv/services/auth.dart';
import 'package:my_cv/theme.dart';
import 'package:my_cv/models/user.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<newUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home: SplashScreen(),
        routes: routes,
      )
    );
  }
}