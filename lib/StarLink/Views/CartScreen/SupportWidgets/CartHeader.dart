import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/customWidgets/StarLinkText.dart';

class CartHeader extends StatefulWidget {
  final Function onTap;
  final Function onTapQR;
  const CartHeader({Key? key, required this.onTap, required this.onTapQR})
      : super(key: key);

  @override
  State<CartHeader> createState() => _CartHeaderState();
}

class _CartHeaderState extends State<CartHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              widget.onTapQR();
            },
            icon: const Icon(Icons.qr_code_scanner_rounded)),
        Expanded(
          child: Center(
            child: StarLinkTextLabel(
              text: "CART",
              fontWeight: FontWeight.w600,
              color: CupertinoColors.label,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              widget.onTap();
            },
            icon: const Icon(Icons.search_sharp))
      ],
    );
  }
}
