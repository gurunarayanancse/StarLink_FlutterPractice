import 'package:flutter/cupertino.dart';

import '../../Models/Category.dart';
import 'ProductListView.dart';
import 'SectionHeader.dart';

class ProductSection extends StatefulWidget {
  Category category;
  Function onProductAddedToCart;
  ProductSection(
      {Key? key, required this.category, required this.onProductAddedToCart})
      : super(key: key);

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          onPressed: () {},
          title: widget.category.title,
        ),
        ProductList(
          productList: widget.category.products,
          doItemAdded: () {
            widget.onProductAddedToCart();
          },
        )
      ],
    );
  }
}
