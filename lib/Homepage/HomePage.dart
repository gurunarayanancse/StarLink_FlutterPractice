import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:star_link/Models/Category.dart';
import 'package:star_link/StarLinkColor.dart';
import 'package:star_link/ViewModel.dart';

import 'SupportWidgets/CategoryListView.dart';
import 'SupportWidgets/Header.dart';
import 'SupportWidgets/ProductCategorySection.dart';

class HomePage extends StatefulWidget {
  final Function refreshCart;

  const HomePage({Key? key, required this.refreshCart}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductViewModel productViewModel = ProductViewModel();
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    List<Category> categoriesList = productViewModel
        .getAllProducts()
        .where((element) => element.products.isNotEmpty)
        .toList();
    int cartQuantity = 0;
    return Scaffold(
        backgroundColor: StarLinkColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Header(
                  onSearch: (value) {
                    setState(() {
                      categoriesList = productViewModel
                          .searchProducts(value)
                          .where((element) => element.products.isNotEmpty)
                          .toList();
                    });
                  },
                  onTap: () {
                    widget.refreshCart();
                    Navigator.pop(context, () {});
                  },
                ),
                CategoryListView(
                    categories: categoriesList,
                    onTapped: (index) {
                      itemScrollController.scrollTo(
                          index: index,
                          duration: const Duration(milliseconds: 100));
                    }),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ScrollablePositionedList.builder(
                        itemScrollController: itemScrollController,
                        itemCount: categoriesList.length,
                        itemBuilder: (_, index) => ProductSection(
                              category: categoriesList.elementAt(index),
                              onProductAddedToCart: () {
                                setState(() {});
                              },
                            ))),
              ],
            ),
          ),
        ));
  }
}
