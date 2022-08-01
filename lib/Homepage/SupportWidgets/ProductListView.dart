import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/ProductVarientScreen/ProductVarientScreen.dart';
import 'package:star_link/ViewModel.dart';
import 'package:star_link/helpers.dart';

import '../../Models/Product.dart';
import 'ProductCard.dart';

class ProductList extends StatefulWidget {
  List<Product> productList;
  Function doItemAdded;
  ProductList({Key? key, required this.productList, required this.doItemAdded})
      : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.productList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 275),
        itemBuilder: (context, index) => ProductCard(
              backgroundColor:
                  widget.productList[index].bgColor[0].withOpacity(0.5),
              price: '\$${widget.productList[index].price}',
              onPressed: () {
                if (widget.productList[index].isCustomizable) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductVariantScreen(
                                productInfo: widget.productList[index],
                              )));
                } else {
                  widget.doItemAdded();
                  ProductViewModel.addToCart(widget.productList[index]);
                  showToast(
                      context, "Added to Bill", const Duration(seconds: 1));
                }
              },
              image: widget.productList[index].image[0],
              title: widget.productList[index].productName,
              isCustomizable: widget.productList[index].isCustomizable,
            ));
  }
}
