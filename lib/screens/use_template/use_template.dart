import "package:flutter/material.dart";
import 'package:my_cv/constants.dart';

import "package:my_cv/screens/use_template/components/body.dart";

class UseTemplateScreen extends StatelessWidget {
  static String routeName = "/use_template_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("")
      ),
      body: Body(),
    );
  }
}