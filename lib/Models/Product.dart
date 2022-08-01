import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Product {
  String id;
  String productName;
  String price;
  List<String> image;
  int qunatity = 1;
  bool isCustomizable;
  List<Color> bgColor;
  List<String>? size;
  String cartId;
  int selectedSizeIndex;
  int selectedColorIndex;
  Product(
      {required this.id,
      required this.productName,
      required this.price,
      required this.image,
      this.bgColor = const [CupertinoColors.lightBackgroundGray],
      this.isCustomizable = false,
      this.size,
      required this.cartId,
      this.selectedColorIndex = 0,
      this.selectedSizeIndex = 0});

  // Product copyWith({ id, productName, price, image, bgColor, isCustomizable, }) {
  //   return Item(
  //     id: id ?? this.id,
  //     nome: nome ?? this.nome,
  //     email: email ?? this.email,
  //     logado: logado ?? this.logado,
  //     mapa: mapa ?? Map.from(this.mapa ?? {}),
  //     lista: lista ?? List.from(this.lista ?? []),
  //   );
  // }
}
