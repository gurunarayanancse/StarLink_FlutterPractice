import 'dart:convert';

import 'Product.dart';

class Category {
  String icon, title;
  List<Product> products;
  Category({required this.title, required this.icon, required this.products});
}

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.status,
    this.message,
    this.success,
    this.data,
  });

  int? status;
  String? message;
  bool? success;
  List<Datum>? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        message: json["message"],
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "success": success,
        "data": List<dynamic>.from((data ?? []).map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.title,
    this.icon,
    this.products,
  });

  String? title;
  String? icon;
  List<Product>? products;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        icon: json["icon"],
        products: List<Product>.from(
            json[" products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        " products":
            List<dynamic>.from((products ?? []).map((x) => x.toJson())),
      };
}
