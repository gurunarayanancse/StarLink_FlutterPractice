import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star_link/StarLink/Helpers/helpers.dart';
import 'package:star_link/StarLink/Views/Authendication/SignUpScreen.dart';
import 'package:star_link/StarLink/Views/CartScreen/CartScreen.dart';

import '../../../customWidgets/RoundedTextField.dart';
import '../../../customWidgets/Separator.dart';
import '../../../customWidgets/StarLinkButtonWithTrippleArrow.dart';
import '../../../customWidgets/StarLinkText.dart';
import '../../../customWidgets/Toast.dart';
import '../../Helpers/StarLinkColor.dart';
import 'SignInScreen.dart';

class SignInComponent extends StatelessWidget {
  bool isSignUpPage;
  FToast fToast = FToast();
  SignInComponent({Key? key, required this.isSignUpPage}) : super(key: key);

  Future<void> moveToHome(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_logged_in", true);
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => CartScreen()), (route) => false);
  }

  RoundedTextField emailTextField = RoundedTextField(
    border: InputBorder.none,
    textColor: StarLinkColors.kPrimaryColor,
    hintText: "Your Email",
    fontWeight: FontWeight.w500,
    icon: Icons.person,
    onChange: (value) {},
  );
  RoundedTextField passwordTextField = RoundedTextField(
    border: InputBorder.none,
    textColor: StarLinkColors.kPrimaryColor,
    hintText: "Your Password",
    fontWeight: FontWeight.w500,
    icon: Icons.lock,
    isPasswordField: true,
    onChange: (value) {},
  );
  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          emailTextField,
          const SizedBox(
            height: 15,
          ),
          passwordTextField,
          MaterialButton(
            onPressed: () {
              if (!emailTextField.controller.text.isValidEmail()) {
                fToast.showToast(
                    child: CustomToast(
                      text: "Invalid Email",
                      leftIcon: null,
                    ),
                    gravity: ToastGravity.BOTTOM,
                    toastDuration: const Duration(seconds: 3));
              } else if (!passwordTextField.controller.text.isValidPassword()) {
                fToast.showToast(
                    child: CustomToast(
                      text: "Password must be at least 5 characters long",
                      leftIcon: null,
                    ),
                    gravity: ToastGravity.BOTTOM,
                    toastDuration: const Duration(seconds: 3));
              } else {
                moveToHome(context);
              }
            },
            child: StarLinkButtonWithArrow(
              title: !isSignUpPage ? "LOGIN" : "SIGNUP",
              borderRadius: 25,
              height: 50,
              color: StarLinkColors.kPrimaryColor,
              margin: const EdgeInsets.only(left: 15, right: 15, top: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StarLinkTextLabel(
                text: !isSignUpPage
                    ? "Are you new user?"
                    : "Already have an account?",
                size: 14,
                color: StarLinkColors.kPrimaryColor,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => !isSignUpPage
                                ? const SignUpScreen()
                                : const SignInScreen()),
                        (route) => route.isFirst);
                  },
                  child: StarLinkTextLabel(
                    text: !isSignUpPage ? "Sign-up" : "Login",
                    size: 14,
                    color: StarLinkColors.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
          if (isSignUpPage) ...[
            const Seperator(
              seperatorText: 'OR',
            ),
            const OAuthView()
          ]
        ],
      ),
    );
  }
}

class OAuthView extends StatefulWidget {
  const OAuthView({Key? key}) : super(key: key);

  @override
  State<OAuthView> createState() => _OAuthViewState();
}

class _OAuthViewState extends State<OAuthView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              onPressed: () {
                print("facebook");
              },
              child: OAuthButtonRounded(
                icon: SvgPicture.asset(
                  "assets/icons/facebook.svg",
                  width: 20,
                  color: StarLinkColors.kPrimaryColor,
                ),
              )),
          MaterialButton(
              onPressed: () {
                print("twitter");
              },
              child: OAuthButtonRounded(
                icon: SvgPicture.asset(
                  "assets/icons/twitter.svg",
                  width: 20,
                  color: StarLinkColors.kPrimaryColor,
                ),
              )),
          MaterialButton(
              onPressed: () {
                print("Google");
              },
              child: OAuthButtonRounded(
                icon: SvgPicture.asset(
                  "assets/icons/google-plus.svg",
                  width: 20,
                  color: StarLinkColors.kPrimaryColor,
                ),
              ))
        ],
      ),
    );
  }
}

class OAuthButtonRounded extends StatelessWidget {
  final SvgPicture icon;
  const OAuthButtonRounded({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(width: 1.5, color: StarLinkColors.kPrimaryLightColor)),
      child: icon,
    );
  }
}
