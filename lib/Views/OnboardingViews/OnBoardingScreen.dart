import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star_link/Helpers/StarLinkColor.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

import '../Authendication/LoginMainWidget.dart';
import '../customWidgets/StarLinkButtonWithTrippleArrow.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List onboardingData = [
    {
      "imageName": "welcome-three.png",
      "title": "Tourisum Facts",
      "sub_title": "Tourism",
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document"
    },
    {
      "imageName": "welcome-two.png",
      "title": "Facts",
      "sub_title": "Tourism",
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document"
    },
    {
      "imageName": "welcome-one.png",
      "title": "Tips",
      "sub_title": "Tourism",
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document"
    },
  ];

  //to get onboardscreen status
  Future<void> setOboardCompletedFlag() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("was_on_board_completed", true);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginMainScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: onboardingData.length,
                itemBuilder: (_, index) {
                  return Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/${onboardingData[index]["imageName"]}'),
                            fit: BoxFit.cover)),
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 150, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StarLinkTextLabel(
                                  text: onboardingData[index]["title"],
                                  color: StarLinkColors.bigTextColor,
                                  fontWeight: FontWeight.bold,
                                  size: 25,
                                ),
                                StarLinkTextLabel(
                                  text: onboardingData[index]["sub_title"],
                                  color: StarLinkColors.textColor1,
                                  fontWeight: FontWeight.normal,
                                  size: 25,
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: 220,
                                  child: StarLinkTextLabel(
                                    text: onboardingData[index]["description"],
                                    color: StarLinkColors.textColor2,
                                    fontWeight: FontWeight.normal,
                                    size: 15,
                                  ),
                                ),
                                if (index == onboardingData.length - 1) ...[
                                  const SizedBox(height: 40),
                                  RawMaterialButton(
                                      onPressed: () {
                                        setOboardCompletedFlag();
                                      },
                                      child: StarLinkButtonWithArrow(
                                        width: 250,
                                        title: "Get Started...",
                                        image: Image.asset(
                                            "assets/images/button-one.png"),
                                      ))
                                ]
                              ],
                            ),
                            Column(
                                children: List.generate(onboardingData.length,
                                    (indexBullet) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 3),
                                width: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexBullet
                                      ? StarLinkColors.mainColor
                                      : StarLinkColors.mainColor
                                          .withOpacity(0.4),
                                ),
                                height: index == indexBullet ? 25 : 8,
                              );
                            }))
                          ]),
                    ),
                  );
                })));
  }
}
