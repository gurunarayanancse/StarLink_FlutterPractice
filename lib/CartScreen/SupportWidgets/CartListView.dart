import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:star_link/StarLinkColor.dart';

import '../../Models/Product.dart';
import 'CartItemCard.dart';

class CartListView extends StatefulWidget {
  final Function doProductsChanged;
  final List<Product> list;
  const CartListView(
      {Key? key, required this.list, required this.doProductsChanged})
      : super(key: key);

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) => Slidable(
              key: Key(widget.list[index].id),
              endActionPane: ActionPane(
                extentRatio: 0.25,
                motion: const ScrollMotion(),
                children: [
                  CustomSlidableAction(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    onPressed: (context) {
                      setState(() {
                        widget.doProductsChanged(0, index);
                      });
                    },
                    foregroundColor: CupertinoColors.white,
                    child: Container(
                      margin: const EdgeInsets.only(top: 15, right: 10),
                      decoration: BoxDecoration(
                          color: StarLinkColors.homePrimaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Icon(CupertinoIcons.delete),
                      ),
                    ),
                  ),
                ],
              ),
              child: CartItemCard(
                product: widget.list[index],
                doProductChanged: (count) {
                  widget.doProductsChanged(count, index);
                },
              ),
            ));
  }
}
