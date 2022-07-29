import 'package:flutter/cupertino.dart';
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
              price: '\$${widget.productList[index].price}',
              onPressed: () {
                widget.doItemAdded();

                ProductViewModel.addToCart(widget.productList[index]);
                showToast(context, "Added to Bill", const Duration(seconds: 1));
              },
              image: widget.productList[index].image,
              title: widget.productList[index].productName,
              isCustomizable: widget.productList[index].isCustomizable,
            ));
  }
}
