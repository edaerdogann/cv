import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_cv/screens/home/home_screen.dart';
import 'package:my_cv/screens/saved/saved_screen.dart';
import 'package:my_cv/screens/sign_in/sign_in_screen.dart';
import 'package:my_cv/services/auth.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = secondaryColor.withOpacity(0.5);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: MenuState.home == selectedMenu
                      ? primaryColor
                      : inActiveIconColor,
                  width: 25,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  color: MenuState.saved == selectedMenu
                      ? primaryColor
                      : inActiveIconColor,
                  width: 25,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SavedScreen.routeName);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/logout.svg",
                  color: MenuState.logout == selectedMenu
                      ? primaryColor
                      : inActiveIconColor,
                  width: 25,
                ),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pushNamed(context, SignInScreen.routeName);
                }
              ),
            ],
          )),
    );
  }
}