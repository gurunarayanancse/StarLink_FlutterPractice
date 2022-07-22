import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/customWidgets/StarLinkText.dart';

class StarLinkButtonWithArrow extends StatelessWidget {
  bool? isResponsive;
  double? width;
  double height;
  double borderRadius;
  String title;
  Color color;
  FontWeight fontWeight;
  Image? image;
  Color textColor;
  EdgeInsets? margin;
  StarLinkButtonWithArrow(
      {Key? key,
      this.isResponsive,
      this.width,
      this.title = "",
      this.height = 50,
      this.borderRadius = 10,
      this.color = StarLinkColors.mainColor,
      this.fontWeight = FontWeight.w500,
      this.image,
      this.textColor = Colors.white,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius), color: color),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        if (title != "") ...[
          StarLinkTextLabel(
            text: title,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ],
        if (image != null) ...[image!]
      ]),
    );
  }
}
