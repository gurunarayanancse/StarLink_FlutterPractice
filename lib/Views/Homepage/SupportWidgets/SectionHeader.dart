import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/Helpers/StarLinkColor.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

class SectionHeader extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  const SectionHeader({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: StarLinkTextLabel(
            text: widget.title,
            size: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
            onPressed: widget.onPressed,
            child: StarLinkTextLabel(
              text: "See more",
              size: 15,
              fontWeight: FontWeight.w500,
              color: StarLinkColors.homePrimaryColor,
            ))
      ],
    );
  }
}
