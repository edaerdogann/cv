import 'package:flutter/material.dart';

import 'package:my_cv/constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: double.infinity,
      width: getProportionateScreenWidth(200),
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
          primary: primaryColor,
          onPrimary: Colors.white,
          elevation: 3,
          textStyle: TextStyle(
            fontSize: 20,
          ),
          // Use MaterialStateProperty.all() for gradient colors
          // Set fallback color if gradient is not supported

        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),

      ),

    );
  }
}