import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:my_cv/screens/sign_in/sign_in_screen.dart';
import 'package:my_cv/services/auth.dart';
import 'package:my_cv/size_config.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  HomeHeaderState createState() => HomeHeaderState();
}

class HomeHeaderState extends State<HomeHeader> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/logout.svg",
              width: 25,
            ),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushNamed(context, SignInScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}