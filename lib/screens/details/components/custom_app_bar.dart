import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:my_cv/constants.dart';
import 'package:my_cv/size_config.dart';

class CustomAppBar extends PreferredSize {
  final double rating;
  bool isPressed = false;

  CustomAppBar({@required this.rating});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child:InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(60),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
              ),

            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/star.svg",
                      width: 25,
                      color: isPressed == true
                          ? primaryColor
                          : Colors.black,
                    ),
                    onPressed: () =>
                        isPressed = !isPressed,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}