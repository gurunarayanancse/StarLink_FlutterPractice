import 'dart:ui';

class Product {
  Product({
    this.id,
    this.cartId,
    this.productName,
    this.price,
    this.image,
    this.bgColor,
    this.isCustomizable,
    this.productBgColor,
    this.size,
  });

  String? id;
  String? cartId;
  String? productName;
  String? price;
  List<String>? image;
  List<Color>? bgColor;
  bool? isCustomizable;
  List<List<int>>? productBgColor;
  List<String>? size;
  int qunatity = 0;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json[" id"],
        cartId: json[" cartId"],
        productName: json[" productName"],
        price: json[" price"],
        image: List<String>.from(json[" image"].map((x) => x)),
        bgColor: List<Color>.from(json[" bgColor"]
            .map((x) => Color.fromARGB(x[0], x[1], x[2], x[3]))),
        isCustomizable: json["isCustomizable"],
        productBgColor: json["bgColor"] == null
            ? null
            : List<List<int>>.from(
                json["bgColor"].map((x) => List<int>.from(x.map((x) => x)))),
        size: json["size"] == null
            ? null
            : List<String>.from(json["size"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        " id": id,
        " cartId": cartId,
        " productName": productName,
        " price": price,
        " image": List<dynamic>.from((image ?? []).map((x) => x)),
        " bgColor": bgColor == null
            ? null
            : List<dynamic>.from(
                bgColor ?? [].map((x) => List<dynamic>.from(x.map((x) => x)))),
        "isCustomizable": isCustomizable,
        "bgColor": productBgColor == null
            ? null
            : List<dynamic>.from(productBgColor ??
                [].map((x) => List<dynamic>.from(x.map((x) => x)))),
        "size":
            size == null ? null : List<dynamic>.from(size ?? [].map((x) => x)),
      };
}
