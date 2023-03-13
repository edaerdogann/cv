import 'package:flutter/material.dart';
import 'package:my_cv/components/no_account_text.dart';
import 'package:my_cv/components/social_media.dart';
import 'package:my_cv/constants.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

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
                  "Sign In",
                  style: TextStyle(
                    color: textColor,
                    fontSize: getProportionateScreenWidth(40),
                    //fontFamily: "Open Sauce Sans",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\nSign in with your email and password\nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
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
                NoAccountText(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}