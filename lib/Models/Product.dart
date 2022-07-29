import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Product {
  String id;
  String productName;
  String price;
  String image;
  Color bgColor;
  int qunatity = 1;
  bool isCustomizable;
  Product(
      {required this.id,
      required this.productName,
      required this.price,
      required this.image,
      this.bgColor = CupertinoColors.lightBackgroundGray,
      this.isCustomizable = false});
}
