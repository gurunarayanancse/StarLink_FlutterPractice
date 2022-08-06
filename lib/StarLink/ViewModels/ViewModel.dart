import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../Models/Category.dart';
import '../Models/Product.dart';

class ProductViewModel {
  List<Category> _categories = [];
  static List<Product> cartProducts = [];
  ProductViewModel() {
    _categories = [
      Category(title: "Chair", icon: "assets/icons/chair.svg", products: [
        Product(
            id: "1",
            cartId: "1",
            productName: "Wooden decorated Chair",
            price: "12.00",
            image: ["assets/images/2.png"],
            bgColor: [const Color.fromARGB(1, 177, 149, 121)]),
        Product(
            id: "2",
            cartId: "2",
            productName: "MultiColored Cushion Chair",
            price: "7.00",
            image: ["assets/images/4.jpg"],
            bgColor: [const Color.fromARGB(1, 76, 92, 84)]),
        Product(
            id: "3",
            cartId: "3",
            productName: "Brown Cushion Chair",
            price: "8.00",
            image: ["assets/images/8.png"],
            bgColor: [const Color.fromARGB(1, 141, 88, 49)]),
        Product(
            id: "4",
            cartId: "4",
            productName: "Blue Chair with leg rest",
            price: "12.00",
            image: ["assets/images/9.png"],
            bgColor: [const Color.fromARGB(1, 130, 150, 151)]),
        Product(
            id: "5",
            cartId: "5",
            productName: "Green Cushion Chair",
            price: "10.00",
            image: ["assets/images/1.png"],
            bgColor: [const Color.fromARGB(1, 90, 103, 101)]),
        Product(
            id: "6",
            cartId: "6",
            productName: "Single sheet Chair",
            price: "3.00",
            image: ["assets/images/10.png"],
            bgColor: [const Color.fromARGB(1, 150, 150, 150)]),
      ]),
      Category(title: "Arm Chair", icon: "assets/icons/sofa.svg", products: [
        Product(
            id: "7",
            cartId: "7",
            productName: "Gray Single sheet Armchair",
            price: "15.00",
            image: ["assets/images/3.png"],
            bgColor: [const Color.fromARGB(1, 127, 128, 130)]),
        Product(
            id: "8",
            cartId: "8",
            productName: "Nike Armchair (Blue)",
            price: "12.00",
            image: ["assets/images/5.png"],
            bgColor: [const Color.fromARGB(1, 12, 30, 60)]),
        Product(
            id: "9",
            cartId: "9",
            productName: "Peter England Armchair (White)",
            price: "12.00",
            image: ["assets/images/6.png"],
            bgColor: [const Color.fromARGB(1, 214, 210, 204)]),
        Product(
            id: "10",
            cartId: "10",
            productName: "Wooden decorated ArmChair",
            price: "12.00",
            image: ["assets/images/11.png"],
            bgColor: [const Color.fromARGB(1, 56, 62, 76)]),
        Product(
            id: "11",
            cartId: "11",
            productName: "Blue Chair",
            price: "7.00",
            image: ["assets/images/12.png"],
            bgColor: [const Color.fromARGB(1, 32, 55, 87)]),
        Product(
            id: "13",
            cartId: "13",
            productName: "Ash colored Chair with leg rest",
            price: "12.00",
            image: [
              "assets/images/15.png",
              "assets/images/14.png",
              "assets/images/16.png"
            ],
            isCustomizable: true,
            bgColor: [
              const Color.fromARGB(1, 167, 166, 171),
              const Color.fromARGB(1, 172, 205, 205),
              const Color.fromARGB(1, 223, 219, 208)
            ],
            size: [
              "S",
              "M",
              "L",
              "XL",
              "XXL",
            ]),
      ]),
      Category(title: "Sofa", icon: "assets/icons/sofa_sleeper.svg", products: [
        Product(
            id: "15",
            cartId: "15",
            productName: "Sofa (Nike)",
            price: "12.00",
            image: [
              "assets/images/17.png",
              "assets/images/18.png",
              "assets/images/19.png"
            ],
            isCustomizable: true,
            bgColor: [
              const Color.fromARGB(1, 31, 37, 70),
              const Color.fromARGB(1, 167, 165, 154),
              const Color.fromARGB(1, 224, 224, 224)
            ],
            size: ["S", "M", "L", "XL", "XXL"]),
      ]),
      Category(title: "Dress", icon: "assets/icons/pants.svg", products: [
        Product(
            id: "17",
            cartId: "17",
            productName: "White Shirt",
            price: "12.00",
            image: ["assets/images/product_0.png"],
            bgColor: [const Color.fromARGB(1, 230, 219, 216)]),
        Product(
            id: "18",
            cartId: "18",
            productName: "Black T-shirt",
            price: "12.00",
            image: ["assets/images/product_1.png"],
            bgColor: [const Color.fromARGB(1, 39, 42, 56)]),
        Product(
            id: "19",
            cartId: "19",
            productName: "Green and white Shirt",
            price: "12.00",
            image: ["assets/images/product_2.png"],
            bgColor: [const Color.fromARGB(1, 11, 22, 18)]),
        Product(
            id: "20",
            cartId: "20",
            productName: "green T-shirt",
            price: "12.00",
            image: ["assets/images/product_3.png"],
            bgColor: [const Color.fromARGB(1, 11, 22, 18)]),
      ]),
    ];
  }

  List<Category> getAllProducts() {
    return _categories;
  }

  List<Category> searchProducts(String value) {
    init();
    List<Category> categoryList = _categories;
    if (value.isEmpty) {
      categoryList = _categories;
    } else {
      for (int index = 0; index < _categories.length; index++) {
        List<Product> products = _categories[index]
            .products
            .where((element) => (element.productName ?? "")
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList();
        categoryList[index].products = products;
      }
    }
    return categoryList;
  }

  init() {
    _categories = [
      Category(title: "Chair", icon: "assets/icons/chair.svg", products: [
        Product(
            id: "1",
            cartId: "1",
            productName: "Wooden decorated Chair",
            price: "12.00",
            image: ["assets/images/2.png"],
            bgColor: [const Color.fromARGB(1, 177, 149, 121)]),
        Product(
            id: "2",
            cartId: "2",
            productName: "MultiColored Cushion Chair",
            price: "7.00",
            image: ["assets/images/4.jpg"],
            bgColor: [const Color.fromARGB(1, 76, 92, 84)]),
        Product(
            id: "3",
            cartId: "3",
            productName: "Brown Cushion Chair",
            price: "8.00",
            image: ["assets/images/8.png"],
            bgColor: [const Color.fromARGB(1, 141, 88, 49)]),
        Product(
            id: "4",
            cartId: "4",
            productName: "Blue Chair with leg rest",
            price: "12.00",
            image: ["assets/images/9.png"],
            bgColor: [const Color.fromARGB(1, 130, 150, 151)]),
        Product(
            id: "5",
            cartId: "5",
            productName: "Green Cushion Chair",
            price: "10.00",
            image: ["assets/images/1.png"],
            bgColor: [const Color.fromARGB(1, 90, 103, 101)]),
        Product(
            id: "6",
            cartId: "6",
            productName: "Single sheet Chair",
            price: "3.00",
            image: ["assets/images/10.png"],
            bgColor: [const Color.fromARGB(1, 150, 150, 150)]),
      ]),
      Category(title: "Arm Chair", icon: "assets/icons/sofa.svg", products: [
        Product(
            id: "7",
            cartId: "7",
            productName: "Gray Single sheet Armchair",
            price: "15.00",
            image: ["assets/images/3.png"],
            bgColor: [const Color.fromARGB(1, 127, 128, 130)]),
        Product(
            id: "8",
            cartId: "8",
            productName: "Nike Armchair (Blue)",
            price: "12.00",
            image: ["assets/images/5.png"],
            bgColor: [const Color.fromARGB(1, 12, 30, 60)]),
        Product(
            id: "9",
            cartId: "9",
            productName: "Peter England Armchair (White)",
            price: "12.00",
            image: ["assets/images/6.png"],
            bgColor: [const Color.fromARGB(1, 214, 210, 204)]),
        Product(
            id: "10",
            cartId: "10",
            productName: "Wooden decorated ArmChair",
            price: "12.00",
            image: ["assets/images/11.png"],
            bgColor: [const Color.fromARGB(1, 56, 62, 76)]),
        Product(
            id: "11",
            cartId: "11",
            productName: "Blue Chair",
            price: "7.00",
            image: ["assets/images/12.png"],
            bgColor: [const Color.fromARGB(1, 32, 55, 87)]),
        Product(
            id: "13",
            cartId: "13",
            productName: "Ash colored Chair with leg rest",
            price: "12.00",
            image: [
              "assets/images/15.png",
              "assets/images/14.png",
              "assets/images/16.png"
            ],
            isCustomizable: true,
            bgColor: [
              const Color.fromARGB(1, 167, 166, 171),
              const Color.fromARGB(1, 172, 205, 205),
              const Color.fromARGB(1, 223, 219, 208)
            ],
            size: [
              "S",
              "M",
              "L",
              "XL",
              "XXL",
            ]),
      ]),
      Category(title: "Sofa", icon: "assets/icons/sofa_sleeper.svg", products: [
        Product(
            id: "15",
            cartId: "15",
            productName: "Sofa (Nike)",
            price: "12.00",
            image: [
              "assets/images/17.png",
              "assets/images/18.png",
              "assets/images/19.png"
            ],
            isCustomizable: true,
            bgColor: [
              const Color.fromARGB(1, 31, 37, 70),
              const Color.fromARGB(1, 167, 165, 154),
              const Color.fromARGB(1, 224, 224, 224)
            ],
            size: ["S", "M", "L", "XL", "XXL"]),
      ]),
      Category(title: "Dress", icon: "assets/icons/pants.svg", products: [
        Product(
            id: "17",
            cartId: "17",
            productName: "White Shirt",
            price: "12.00",
            image: ["assets/images/product_0.png"],
            bgColor: [const Color.fromARGB(1, 230, 219, 216)]),
        Product(
            id: "18",
            cartId: "18",
            productName: "Black T-shirt",
            price: "12.00",
            image: ["assets/images/product_1.png"],
            bgColor: [const Color.fromARGB(1, 39, 42, 56)]),
        Product(
            id: "19",
            cartId: "19",
            productName: "Green and white Shirt",
            price: "12.00",
            image: ["assets/images/product_2.png"],
            bgColor: [const Color.fromARGB(1, 11, 22, 18)]),
        Product(
            id: "20",
            cartId: "20",
            productName: "green T-shirt",
            price: "12.00",
            image: ["assets/images/product_3.png"],
            bgColor: [const Color.fromARGB(1, 11, 22, 18)]),
      ]),
    ];
  }

  static CartModel getCartArray() {
    List<double> priceList = cartProducts.isNotEmpty
        ? cartProducts
            .map((e) => double.parse(e.price!) * e.qunatity ?? 0.0)
            .toList()
        : [0];
    double productTotal = priceList.reduce((value, element) => value + element);
    double toPay = productTotal + 0;
    CartModel cartData = CartModel(
        productPay: productTotal, toPay: toPay, productList: cartProducts);
    return cartData;
  }

  static void addToCart(Product product) {
    int index = cartProducts.map((e) => e.cartId).toList().indexOf(
        "${product.id}_color${product.selectedColorIndex}_size${product.selectedSizeIndex}");
    product.cartId =
        "${product.id}_color${product.selectedColorIndex}_size${product.selectedSizeIndex}";
    if (index < 0) {
      cartProducts = [product, ...cartProducts];
    } else {
      cartProducts[index].qunatity++;
    }
  }
}

class CartModel {
  double productPay;
  double toPay;
  List<Product> productList;

  CartModel({
    required this.productPay,
    required this.toPay,
    required this.productList,
  });
}
