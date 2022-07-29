import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/customWidgets/StarLinkText.dart';

import '../../Homepage/SupportWidgets/QuantityButton.dart';
import '../../Models/Product.dart';

class CartItemCard extends StatefulWidget {
  Product product;
  Function doProductChanged;
  CartItemCard(
      {Key? key, required this.product, required this.doProductChanged})
      : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: CupertinoColors.lightBackgroundGray, blurRadius: 5)
            ]),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                  borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                widget.product.image,
                width: 75,
                height: 82,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width * 0.35,
                  child: StarLinkTextLabel(
                    maxLines: 2,
                    color: Colors.black54,
                    text: widget.product.productName,
                    fontWeight: FontWeight.w500,
                    size: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                StarLinkTextLabel(
                  maxLines: 1,
                  text: "\$${widget.product.price}",
                  fontWeight: FontWeight.w600,
                  size: 14,
                )
              ],
            ),
            const Spacer(),
            QuantityButton(
                quantity: widget.product.qunatity,
                increase: (count) {
                  setState(() {
                    widget.doProductChanged(count);
                    widget.product.qunatity = count;
                  });
                },
                decrease: (count) {
                  setState(() {
                    widget.doProductChanged(count);
                    widget.product.qunatity = count;
                  });
                })
          ],
        ));
  }
}
