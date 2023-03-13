import 'package:flutter/material.dart';

import 'package:my_cv/screens/saved/components/body.dart';
import 'package:my_cv/components/nav_bar.dart';
import 'package:my_cv/enums.dart';

class SavedScreen extends StatelessWidget {
  static String routeName = "/saved";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.saved),
    );
  }
}