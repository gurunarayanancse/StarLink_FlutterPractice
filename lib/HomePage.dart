import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/customWidgets/StarLinkText.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StarLinkTextLabel(
              text: "Home",
            ),
          ],
        ),
      ),
    );
  }
}
