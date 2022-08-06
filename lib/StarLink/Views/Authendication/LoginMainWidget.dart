import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:star_link/StarLink/Helpers/StarLinkColor.dart';

import '../../../customWidgets/StarLinkText.dart';
import 'WelcomeScreenBackground.dart';
import 'welcomeScreenAuthBtnGroup.dart';

class LoginMainScreen extends StatelessWidget {
  const LoginMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginMainScreenBackgroundView(
          topLeftImage: Image.asset(
            "assets/images/main_top.png",
            width: screenSize.width * 0.3,
          ),
          bottomLeftImage: Image.asset(
            "assets/images/main_bottom.png",
            width: screenSize.width * 0.2,
          ),
          screenSize: screenSize,
          bodyContent: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                StarLinkTextLabel(
                  text: "WELCOME TO STARLINK",
                  color: StarLinkColors.kPrimaryColor,
                  fontWeight: FontWeight.w700,
                  size: 18,
                ),
                SizedBox(
                  height: screenSize.height * 0.075,
                ),
                SvgPicture.asset(
                  "assets/icons/chat.svg",
                  height: screenSize.height * 0.4,
                ),
                SizedBox(
                  height: screenSize.height * 0.09,
                ),
                const AuthendicationButtonGroup()
              ],
            ),
          )),
    );
  }
}
