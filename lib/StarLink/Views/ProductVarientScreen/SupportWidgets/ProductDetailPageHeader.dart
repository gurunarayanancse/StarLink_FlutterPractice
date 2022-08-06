import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/StarLink/Helpers/StarLinkColor.dart';
import 'package:star_link/customWidgets/StarLinkText.dart';

class ProductDetailPageHeader extends StatefulWidget {
  int cartCount;
  Function onTapCart;
  Function onTapBack;
  ProductDetailPageHeader(
      {Key? key,
      required this.cartCount,
      required this.onTapCart,
      required this.onTapBack})
      : super(key: key);

  @override
  State<ProductDetailPageHeader> createState() =>
      _ProductDetailPageHeaderState();
}

class _ProductDetailPageHeaderState extends State<ProductDetailPageHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, bottom: 15),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                widget.onTapBack();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: StarLinkColors.homePrimaryColor,
              )),
          Expanded(
            child: Center(
              child: StarLinkTextLabel(
                text: "Variants",
                size: 17,
                fontWeight: FontWeight.w600,
                color: StarLinkColors.homePrimaryColor,
              ),
            ),
          ), //
          if (widget.cartCount > 0)
            Badge(
              badgeContent: StarLinkTextLabel(
                text: "${widget.cartCount}",
                size: 15,
                color: CupertinoColors.white,
                fontWeight: FontWeight.w600,
              ),
              child: IconButton(
                  onPressed: () {
                    widget.onTapCart();
                  },
                  icon: const Icon(
                    CupertinoIcons.cart,
                    color: StarLinkColors.homePrimaryColor,
                  )),
            ),
        ],
      ),
    );
  }
}
