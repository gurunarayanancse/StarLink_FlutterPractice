import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/Views/Authendication/WelcomeScreenBackground.dart';
import 'package:star_link/Views/Authendication/signInComponentGroupWidget.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginMainScreenBackgroundView(
        screenSize: screenSize,
        topLeftImage: Image.asset(
          "assets/images/signup_top.png",
          width: screenSize.width * 0.35,
        ),
        bottomLeftImage: Image.asset(
          "assets/images/main_bottom.png",
          width: screenSize.width * 0.25,
        ),
        bodyContent: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StarLinkTextLabel(
                text: "SIGNUP",
                size: 20,
                color: StarLinkColors.kPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 5,
              ),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                width: screenSize.height * 0.35,
              ),
              const SizedBox(
                height: 5,
              ),
              SignInComponent(
                isSignUpPage: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
