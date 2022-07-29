import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarLinkTextLabel extends StatelessWidget {
  double size;
  Color color;
  FontWeight fontWeight;
  final String text;
  String fontFamily;
  int maxLines;
  StarLinkTextLabel(
      {Key? key,
      required this.text,
      this.size = 17,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.fontFamily = "Poppins",
      this.maxLines = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: size,
            color: color,
            fontWeight: fontWeight,
            fontFamily: fontFamily),
        textAlign: TextAlign.left);
  }
}
