import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star_link/OnboardingViews/OnBoardingScreen.dart';

import 'Authendication/LoginMainWidget.dart';
import 'HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("is_logged_in") != null
      ? prefs.getBool("is_logged_in")!
      : false;
  bool isOnboardCompleted = prefs.getBool("was_on_board_completed") != null
      ? prefs.getBool("was_on_board_completed")!
      : false;
  Widget app = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StarLink',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.green,
          fontFamily: "Poppins",
          textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 17))),
      home: isLoggedIn
          ? const HomePage()
          : isOnboardCompleted
              ? const LoginMainScreen()
              : const OnboardingScreen());
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
