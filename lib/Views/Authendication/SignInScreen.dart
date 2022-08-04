import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/Views/Authendication/WelcomeScreenBackground.dart';
import 'package:star_link/Views/Authendication/signInComponentGroupWidget.dart';

import '../customWidgets/StarLinkText.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginMainScreenBackgroundView(
        screenSize: screenSize,
        topLeftImage: Image.asset(
          "assets/images/main_top.png",
          width: screenSize.width * 0.35,
        ),
        bottomRightImage: Image.asset(
          "assets/images/login_bottom.png",
          width: screenSize.width * 0.4,
        ),
        bodyContent: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StarLinkTextLabel(
                text: "WELCOME BACK",
                fontWeight: FontWeight.w700,
                color: StarLinkColors.kPrimaryColor,
                size: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              SvgPicture.asset(
                "assets/icons/login.svg",
                width: screenSize.height * 0.375,
              ),
              const SizedBox(
                height: 5,
              ),
              SignInComponent(
                isSignUpPage: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
