import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

enum QuantityButtonDirection { vertical, horizontal }

class QuantityButton extends StatefulWidget {
  final Function increase;
  int quantity;
  final QuantityButtonDirection direction;
  final Function decrease;
  QuantityButton(
      {Key? key,
      required this.increase,
      required this.decrease,
      this.quantity = 0,
      this.direction = QuantityButtonDirection.vertical})
      : super(key: key);

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  Widget getPlusBtn() {
    return GestureDetector(
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
                    color: CupertinoColors.lightBackgroundGray, blurRadius: 3)
              ]),
          child: Center(
            child: StarLinkTextLabel(
              text: "+",
              fontWeight: FontWeight.w600,
              size: 20,
              color: CupertinoColors.white,
            ),
          )),
    );
  }

  Widget getMinusBtn() {
    return GestureDetector(
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
                BoxShadow(color: StarLinkColors.homePrimaryColor, blurRadius: 3)
              ]),
          child: Center(
            child: StarLinkTextLabel(
              text: "-",
              fontWeight: FontWeight.w600,
              size: 20,
              color: StarLinkColors.homePrimaryColor,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: widget.direction == QuantityButtonDirection.vertical
          ? Column(children: [
              getPlusBtn(),
              StarLinkTextLabel(
                text: "${widget.quantity}",
                fontWeight: FontWeight.w600,
                size: 15,
                color: StarLinkColors.homePrimaryColor,
              ),
              getMinusBtn()
            ])
          : Row(
              children: [
                getMinusBtn(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: StarLinkTextLabel(
                    text: "${widget.quantity}",
                    fontWeight: FontWeight.w600,
                    size: 15,
                    color: StarLinkColors.homePrimaryColor,
                  ),
                ),
                getPlusBtn(),
              ],
            ),
    );
  }
}
