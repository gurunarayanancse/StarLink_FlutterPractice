import 'package:flutter/material.dart';

import '../StarLink/Helpers/StarLinkColor.dart';
import 'StarLinkText.dart';

class Seperator extends StatelessWidget {
  final String seperatorText;
  const Seperator({Key? key, required this.seperatorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.75,
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            height: 1.5,
            color: StarLinkColors.kPrimaryColor,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: StarLinkTextLabel(
              text: seperatorText,
              color: StarLinkColors.kPrimaryColor,
              fontWeight: FontWeight.w600,
              size: 14,
            ),
          ),
          const Expanded(
              child: Divider(
            height: 1.5,
            color: StarLinkColors.kPrimaryColor,
          )),
        ],
      ),
    );
  }
}
