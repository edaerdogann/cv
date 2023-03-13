import 'package:flutter/material.dart';

import 'package:my_cv/constants.dart';
import 'package:my_cv/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: SizeConfig.screenHeight * 0.15),
        //Image.asset(
        //           "assets/images/logo-2.png",
        //           height: SizeConfig.screenWidth * 0.2,
        //         ),
        //         SizedBox(height: SizeConfig.screenHeight * 0.05),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(300),
        ),
      ],
    );
  }
}