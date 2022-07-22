import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/StarLinkColor.dart';

class RoundedTextField extends StatefulWidget {
  final String hintText;
  final InputBorder border;
  Color textColor;
  EdgeInsets padding;
  FontWeight? fontWeight;
  IconData? icon;
  double fontSize;
  bool passwordEncrypted = true;
  bool isPasswordField;
  TextEditingController controller = TextEditingController();
  RoundedTextField({
    Key? key,
    this.hintText = "",
    this.textColor = StarLinkColors.kPrimaryColor,
    this.padding = const EdgeInsets.only(left: 25),
    this.border = InputBorder.none,
    this.fontWeight = FontWeight.normal,
    this.icon,
    this.fontSize = 15,
    this.isPasswordField = false,
  }) : super(key: key);
  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.controller = controller;
    return RoundedTextFieldContainer(
        padding: const EdgeInsets.only(left: 25, right: 10),
        textField: Stack(
          children: [
            TextField(
              controller: controller,
              obscureText:
                  widget.isPasswordField ? widget.passwordEncrypted : false,
              cursorColor: widget.textColor,
              style: TextStyle(
                  color: widget.textColor,
                  fontWeight: widget.fontWeight,
                  fontSize: widget.fontSize),
              decoration: InputDecoration(
                  icon: widget.icon != null
                      ? Icon(
                          widget.icon,
                          color: widget.textColor,
                        )
                      : null,
                  hintText: widget.hintText,
                  border: widget.border,
                  hintStyle: TextStyle(
                      color: widget.textColor.withOpacity(0.7),
                      fontWeight: widget.fontWeight)),
            ),
            if (widget.isPasswordField) ...[
              Positioned(
                  right: 10,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.passwordEncrypted = !widget.passwordEncrypted;
                        });
                      },
                      icon: Icon(
                        !widget.passwordEncrypted
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: StarLinkColors.kPrimaryColor,
                      )))
            ]
          ],
        ));
  }
}

// Container for Rounded Rectangle
class RoundedTextFieldContainer extends StatefulWidget {
  Color color;
  double height;
  double borderRadius;
  EdgeInsets margin;
  Widget textField;
  EdgeInsets? padding;
  RoundedTextFieldContainer(
      {Key? key,
      this.color = StarLinkColors.kPrimaryLightColor,
      this.height = 50,
      this.borderRadius = 25,
      this.margin = const EdgeInsets.only(left: 25, top: 15, right: 25),
      required this.textField,
      this.padding})
      : super(key: key);

  @override
  State<RoundedTextFieldContainer> createState() =>
      _RoundedTextFieldContainerState();
}

class _RoundedTextFieldContainerState extends State<RoundedTextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.color,
      ),
      child: widget.textField,
    );
  }
}
