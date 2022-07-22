import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../StarLinkColor.dart';
import '../customWidgets/StarLinkButtonWithTrippleArrow.dart';
import 'SignInScreen.dart';
import 'SignUpScreen.dart';

class AuthendicationButtonGroup extends StatefulWidget {
  const AuthendicationButtonGroup({Key? key}) : super(key: key);

  @override
  State<AuthendicationButtonGroup> createState() =>
      _AuthendicationButtonGroupState();
}

class _AuthendicationButtonGroupState extends State<AuthendicationButtonGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Column(children: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            },
            child: StarLinkButtonWithArrow(
              title: "LOGIN",
              borderRadius: 25,
              fontWeight: FontWeight.w600,
              color: StarLinkColors.kPrimaryColor,
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: StarLinkButtonWithArrow(
              title: "SIGNUP",
              borderRadius: 25,
              fontWeight: FontWeight.w600,
              color: StarLinkColors.kPrimaryColor.withOpacity(0.2),
              textColor: StarLinkColors.kPrimaryColor,
            ),
          )
        ]));
  }
}
