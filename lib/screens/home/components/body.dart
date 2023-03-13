import 'package:flutter/material.dart';

import 'package:my_cv/size_config.dart';
import 'package:my_cv/screens/home/components/home_header.dart';
import 'package:my_cv/screens/home/components/best_template.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            Text("W E L C O M E    T O", style: TextStyle(fontSize: 15)),
            SizedBox(height: 10),
            Container(
                height: 70,
                child: Image.asset("assets/images/logo-2.png")
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            BestTemplates(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}