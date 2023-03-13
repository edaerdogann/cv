import 'package:flutter/material.dart';
import 'package:my_cv/components/template_card.dart';
import 'package:my_cv/models/template.dart';

import 'package:my_cv/screens/home/components/section_title.dart';
import 'package:my_cv/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenWidth(10)),
            Padding(
                padding:
                EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Favourite Templates",
                    style: TextStyle(fontSize: 30),
                  ),
                )
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            SingleChildScrollView(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...List.generate(
                    favTemplates.length,
                        (index) {
                      return TemplateCard(template: favTemplates[index]);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}