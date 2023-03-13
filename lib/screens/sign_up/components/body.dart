import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cv/constants.dart';
import 'package:my_cv/size_config.dart';
import 'package:my_cv/components/social_media.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text(
                    "Sign Up",
                  style: TextStyle(
                    color: textColor,
                    fontSize: getProportionateScreenWidth(40),
                    //fontFamily: "Open Sauce Sans",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\nEnter your information or continue\nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMedia(
                      icon: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocialMedia(
                      icon: "assets/icons/google.svg",
                      press: () {},
                    ),
                    SocialMedia(
                      icon: "assets/icons/linkedin.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing you agree on our terms and conditions.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}