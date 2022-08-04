import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/Helpers/StarLinkColor.dart';
import 'package:star_link/Views/customWidgets/StarLinkButtonWithTrippleArrow.dart';

import '../../customWidgets/StarLinkText.dart';

class BillView extends StatefulWidget {
  final double ordarPay;
  final double toPay;
  const BillView({Key? key, required this.ordarPay, required this.toPay})
      : super(key: key);

  @override
  State<BillView> createState() => _BillViewState();
}

class _BillViewState extends State<BillView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CupertinoColors.white,
          boxShadow: const [
            BoxShadow(color: CupertinoColors.lightBackgroundGray, blurRadius: 3)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: StarLinkTextLabel(
              text: "Bill Details",
              fontWeight: FontWeight.w600,
              size: 15,
            ),
          ),
          BillDetailRow(
              billTitle: "Order total",
              price: "\$${widget.ordarPay.toStringAsFixed(2)}"),
          BillDetailRow(
              billTitle: "To pay",
              price: "\$${widget.toPay.toStringAsFixed(2)}"),
          StarLinkButtonWithArrow(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            title: "Checkout",
            color: StarLinkColors.homePrimaryColor,
            textColor: CupertinoColors.white,
            fontWeight: FontWeight.w600,
            rightIcon: const Icon(
              Icons.arrow_forward,
              color: CupertinoColors.white,
            ),
            alignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }
}

class BillDetailRow extends StatefulWidget {
  String billTitle;
  String price;

  BillDetailRow({Key? key, required this.billTitle, required this.price})
      : super(key: key);

  @override
  State<BillDetailRow> createState() => _BillDetailRowState();
}

class _BillDetailRowState extends State<BillDetailRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StarLinkTextLabel(
            text: widget.billTitle,
            size: 15,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
          StarLinkTextLabel(
            text: widget.price,
            size: 15,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
