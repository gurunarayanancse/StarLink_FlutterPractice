import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/Helpers/StarLinkColor.dart';

import 'StarLinkText.dart';

class CustomToast extends StatefulWidget {
  EdgeInsets padding;
  double borderRadius;
  Color backgroundColor;
  Icon? leftIcon;
  double spacing;
  String text;
  Color fontColor;
  FontWeight fontWeight;
  double fontSize;

  CustomToast(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      this.borderRadius = 17.5,
      this.backgroundColor = StarLinkColors.kPrimaryColor,
      this.spacing = 15,
      this.leftIcon,
      required this.text,
      this.fontColor = Colors.white,
      this.fontSize = 15,
      this.fontWeight = FontWeight.w400})
      : super(key: key);
  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.backgroundColor),
      child: Wrap(
        spacing: widget.spacing,
        children: [
          if (widget.leftIcon != null) ...[
            widget.leftIcon!,
          ],
          StarLinkTextLabel(
            text: widget.text,
            color: widget.fontColor,
            fontWeight: widget.fontWeight,
            size: widget.fontSize,
          )
        ],
      ),
    );
  }
}
