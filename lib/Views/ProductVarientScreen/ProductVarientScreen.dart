import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:star_link/Models/Product.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/ViewModel.dart';
import 'package:star_link/Views//CartScreen/CartScreen.dart';
import 'package:star_link/Views/Homepage/SupportWidgets/QuantityButton.dart';
import 'package:star_link/Views/customWidgets/StarLinkButtonWithTrippleArrow.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

import 'SupportWidgets/ProductDetailPageHeader.dart';
import 'SupportWidgets/ProductInformationView.dart';

class ProductVariantScreen extends StatefulWidget {
  final Product productInfo;
  const ProductVariantScreen({Key? key, required this.productInfo})
      : super(key: key);

  @override
  State<ProductVariantScreen> createState() => _ProductVariantScreenState();
}

class _ProductVariantScreenState extends State<ProductVariantScreen> {
  Widget getPriceView() {
    return Row(
      children: [
        StarLinkTextLabel(
          text: "\$ ",
          size: 17,
          fontWeight: FontWeight.w700,
          color: StarLinkColors.homePrimaryColor,
        ),
        StarLinkTextLabel(
          text: widget.productInfo.price,
          size: 27,
          fontWeight: FontWeight.w800,
          // color: StarLinkColors.homePrimaryColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    CartModel cartInfo = ProductViewModel.getCartArray();
    return SafeArea(
        child: Scaffold(
      backgroundColor: StarLinkColors.backgroundColor,
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ProductDetailPageHeader(
                  onTapBack: () {
                    Navigator.pop(context);
                  },
                  cartCount: ProductViewModel.getCartArray().productList.length,
                  onTapCart: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => CartScreen()),
                        (route) => false);
                  },
                ),
                ProductInformationView(
                  product: widget.productInfo,
                  onChangeColor: (colorIndex) {
                    setState(() {
                      widget.productInfo.selectedColorIndex = colorIndex;
                    });
                  },
                  onChangeSize: (sizeIndex) {
                    setState(() {
                      widget.productInfo.selectedSizeIndex = sizeIndex;
                    });
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getPriceView(),
                    StarLinkTextLabel(
                      text: "Total Payable",
                      size: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ],
                ),
                const Spacer(),
                if (cartInfo.productList
                    .where((element) =>
                        element.cartId ==
                        "${widget.productInfo.id}_color${widget.productInfo.selectedColorIndex}_size${widget.productInfo.selectedSizeIndex}")
                    .toList()
                    .isEmpty)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        ProductViewModel.addToCart(widget.productInfo);
                      });
                    },
                    child: StarLinkButtonWithArrow(
                      height: 45,
                      textSize: 16,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      title: "Add To Cart",
                      color: Colors.black,
                      borderRadius: 10,
                      textColor: CupertinoColors.white,
                      fontWeight: FontWeight.w600,
                      rightIcon: const Icon(
                        Icons.shopping_basket,
                        color: CupertinoColors.white,
                        size: 18,
                      ),
                    ),
                  )
                else
                  QuantityButton(
                    direction: QuantityButtonDirection.horizontal,
                    increase: (count) {
                      updateCart(count);
                    },
                    decrease: (count) {
                      updateCart(count);
                    },
                    quantity: widget.productInfo.qunatity,
                  )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void updateCart(int count) {
    ProductViewModel.addToCart(widget.productInfo);
  }
}
