import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/StarLink/Helpers/StarLinkColor.dart';
import 'package:star_link/StarLink/ViewModels/ViewModel.dart';
import 'package:star_link/StarLink/Views/CartScreen/SupportWidgets/CartHeader.dart';
import 'package:star_link/StarLink/Views/CartScreen/SupportWidgets/CartListView.dart';
import 'package:star_link/StarLink/Views/Homepage/HomePage.dart';
import 'package:star_link/StarLink/Views/QRScreen/QRScreen.dart';
import 'package:star_link/customWidgets/StarLinkText.dart';

import '../../Models/Product.dart';
import 'SupportWidgets/BillView.dart';

class CartScreen extends StatefulWidget {
  List<Product> productList = [];
  double productTotal = 0.0;
  double toPay = 0.0;
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    refreshStates();
  }

  void refreshStates() {
    setState(() {
      CartModel cartData = ProductViewModel.getCartArray();
      widget.productList = cartData.productList;
      widget.productTotal = cartData.productPay;
      widget.toPay = cartData.toPay;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // print(widget.productList.map((e) => e.cartId));
    return Scaffold(
      backgroundColor: widget.productList.isEmpty
          ? CupertinoColors.white
          : StarLinkColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartHeader(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => HomePage(
                              refreshCart: () {
                                refreshStates();
                              },
                            )));
              },
              onTapQR: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => const QRScreen()));
              },
            ),
            if (widget.productList.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: StarLinkTextLabel(
                  text: "Products List",
                  fontWeight: FontWeight.w600,
                  size: 15,
                  color: StarLinkColors.bigTextColor,
                ),
              ),
              Expanded(
                  child: CartListView(
                list: widget.productList,
                doProductsChanged: (count, index) {
                  setState(() {
                    if (count > 0) {
                      widget.productList[index].qunatity = count;
                    } else {
                      widget.productList.removeAt(index);
                    }
                    refreshStates();
                  });
                },
              )),
              BillView(ordarPay: widget.productTotal, toPay: widget.toPay)
            ] else ...[
              Container(
                margin: const EdgeInsets.only(top: 70),
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/relax.jpg",
                        width: screenSize.width * 0.8,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      StarLinkTextLabel(
                        text: "No more Orders Relax!....",
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: StarLinkColors.homePrimaryColor,
                      )
                    ]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
