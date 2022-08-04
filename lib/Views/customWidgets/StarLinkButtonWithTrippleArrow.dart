import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

class StarLinkButtonWithArrow extends StatelessWidget {
  bool? isResponsive;
  double? width;
  double height;
  double textSize;
  double borderRadius;
  String title;
  Color color;
  FontWeight fontWeight;
  Image? image;
  Color textColor;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Icon? rightIcon;
  MainAxisAlignment alignment;
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
      this.margin,
      this.rightIcon,
      this.alignment = MainAxisAlignment.spaceAround,
      this.padding,
      this.textSize = 17})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius), color: color),
      child: Row(mainAxisAlignment: alignment, children: [
        if (title != "") ...[
          StarLinkTextLabel(
            text: title,
            color: textColor,
            fontWeight: fontWeight,
            size: textSize,
          ),
        ],
        if (image != null) ...[image!],
        if (rightIcon != null) ...[
          const SizedBox(
            width: 10,
          ),
          rightIcon!
        ]
      ]),
    );
  }
}
