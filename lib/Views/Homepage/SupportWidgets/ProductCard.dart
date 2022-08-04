import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../customWidgets/StarLinkText.dart';

class ProductCard extends StatefulWidget {
  final Function onPressed;
  final String image;
  final String price;
  final String title;
  final Color backgroundColor;
  final bool isCustomizable;
  const ProductCard(
      {Key? key,
      required this.image,
      required this.price,
      required this.onPressed,
      required this.title,
      this.backgroundColor = CupertinoColors.lightBackgroundGray,
      required this.isCustomizable})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.onPressed();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        width: 155,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CupertinoColors.white,
            boxShadow: const [
              BoxShadow(
                  color: CupertinoColors.lightBackgroundGray, blurRadius: 2)
            ]),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    widget.image,
                    height: 120,
                    width: 120,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              StarLinkTextLabel(
                text: widget.title,
                size: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                maxLines: 2,
              ),
              const SizedBox(
                width: 10,
              ),
              StarLinkTextLabel(
                text: widget.price,
                size: 15,
                fontWeight: FontWeight.w500,
              ),
              // QuantityButton(
              //   isCustomizable: widget.isCustomizable,
              //   decrease: () {},
              //   increase: () {},
              // )
            ])
          ],
        ),
      ),
    );
  }
}
