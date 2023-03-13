import 'package:flutter/material.dart';
import 'package:my_cv/components/nav_bar.dart';
import 'package:my_cv/enums.dart';
import 'package:my_cv/models/users.dart';
import 'package:my_cv/services/database.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}