import 'package:flutter/material.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

class QRHeader extends StatelessWidget {
  const QRHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: StarLinkColors.homePrimaryColor,
            )),
        Expanded(
            child: Center(
          child: StarLinkTextLabel(
            text: "SCAN QR",
            fontWeight: FontWeight.w600,
            size: 17,
            color: StarLinkColors.homePrimaryColor,
          ),
        )),
        const SizedBox(
          width: 70,
        )
      ],
    );
  }
}
