import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/customWidgets/StarLinkText.dart';

class QuantityButton extends StatefulWidget {
  final Function increase;
  int quantity;
  final Function decrease;
  QuantityButton(
      {Key? key,
      required this.increase,
      required this.decrease,
      this.quantity = 0})
      : super(key: key);

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.quantity++;
              widget.increase(widget.quantity);
            });
          },
          child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: StarLinkColors.homePrimaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: CupertinoColors.lightBackgroundGray,
                        blurRadius: 3)
                  ]),
              child: Center(
                child: StarLinkTextLabel(
                  text: "+",
                  fontWeight: FontWeight.w600,
                  size: 20,
                  color: CupertinoColors.white,
                ),
              )),
        ),
        StarLinkTextLabel(
          text: "${widget.quantity}",
          fontWeight: FontWeight.w600,
          size: 15,
          color: StarLinkColors.homePrimaryColor,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.quantity = widget.quantity > 0 ? widget.quantity - 1 : 0;
              widget.decrease(widget.quantity);
            });
          },
          child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: StarLinkColors.homePrimaryColor, blurRadius: 3)
                  ]),
              child: Center(
                child: StarLinkTextLabel(
                  text: "-",
                  fontWeight: FontWeight.w600,
                  size: 20,
                  color: StarLinkColors.homePrimaryColor,
                ),
              )),
        ),
      ]),
    );
  }
}
