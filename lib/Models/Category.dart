import './Product.dart';

class Category {
  String icon, title;
  List<Product> products;
  Category({required this.title, required this.icon, required this.products});
}
