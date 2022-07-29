import 'Models/Category.dart';
import 'Models/Product.dart';

class ProductViewModel {
  List<Category> categories = [];
  static List<Product> cartProducts = [];
  ProductViewModel() {
    categories = [
      Category(title: "Chair", icon: "assets/icons/chair.svg", products: [
        Product(
          id: "1",
          productName: "Wooden decorated Chair",
          price: "12.00",
          image: "assets/images/2.png",
        ),
        Product(
            id: "2",
            productName: "MultiColored Cushion Chair",
            price: "7.00",
            image: "assets/images/4.jpg",
            isCustomizable: true),
        Product(
            id: "3",
            productName: "Brown Cushion Chair",
            price: "8.00",
            image: "assets/images/8.png",
            isCustomizable: true),
        Product(
          id: "4",
          productName: "Blue Chair with leg rest",
          price: "12.00",
          image: "assets/images/9.png",
        ),
        Product(
          id: "5",
          productName: "Green Cushion Chair",
          price: "10.00",
          image: "assets/images/1.png",
        ),
        Product(
            id: "6",
            productName: "Single sheet Chair",
            price: "3.00",
            image: "assets/images/10.png",
            isCustomizable: true)
      ]),
      Category(title: "Arm Chair", icon: "assets/icons/sofa.svg", products: [
        Product(
          id: "7",
          productName: "Gray Single sheet Armchair",
          price: "15.00",
          image: "assets/images/3.png",
        ),
        Product(
          id: "8",
          productName: "Nike Armchair (Blue)",
          price: "12.00",
          image: "assets/images/5.png",
        ),
        Product(
          id: "9",
          productName: "Peter England Armchair (White)",
          price: "12.00",
          image: "assets/images/6.png",
        ),
        Product(
          id: "10",
          productName: "Wooden decorated ArmChair",
          price: "12.00",
          image: "assets/images/11.png",
        ),
        Product(
          id: "11",
          productName: "Blue Chair",
          price: "7.00",
          image: "assets/images/12.png",
        ),
        Product(
          id: "12",
          productName: "Brown Cushion Chair",
          price: "8.00",
          image: "assets/images/8.png",
        ),
        Product(
          id: "13",
          productName: "Ash colored Chair with leg rest",
          price: "12.00",
          image: "assets/images/15.png",
        ),
      ]),
      Category(title: "Sofa", icon: "assets/icons/sofa_sleeper.svg", products: [
        Product(
          id: "14",
          productName: "Sofa Blue",
          price: "12.00",
          image: "assets/images/17.png",
        ),
        Product(
            id: "15",
            productName: "Sofa (Nike)",
            price: "12.00",
            image: "assets/images/18.png",
            isCustomizable: true),
        Product(
            id: "16",
            productName: "Sofa (White)",
            price: "12.00",
            image: "assets/images/19.png",
            isCustomizable: true),
      ]),
      Category(title: "Dress", icon: "assets/icons/pants.svg", products: [
        Product(
          id: "17",
          productName: "White Shirt",
          price: "12.00",
          image: "assets/images/product_0.png",
        ),
        Product(
          id: "18",
          productName: "Black T-shirt",
          price: "12.00",
          image: "assets/images/product_1.png",
        ),
        Product(
          id: "19",
          productName: "Green and white Shirt",
          price: "12.00",
          image: "assets/images/product_2.png",
        ),
        Product(
          id: "20",
          productName: "green T-shirt",
          price: "12.00",
          image: "assets/images/product_3.png",
        ),
      ]),
    ];
  }
  List<Category> searchProducts(String value) {
    init();
    List<Category> categoryList = categories;
    if (value.isEmpty) {
      categoryList = categories;
    } else {
      for (int index = 0; index < categories.length; index++) {
        List<Product> products = categories[index]
            .products
            .where((element) =>
                element.productName.toLowerCase().contains(value.toLowerCase()))
            .toList();
        categoryList[index].products = products;
      }
    }
    return categoryList;
  }

  init() {
    categories = [
      Category(title: "Chair", icon: "assets/icons/chair.svg", products: [
        Product(
          id: "1",
          productName: "Wooden decorated Chair",
          price: "12.00",
          image: "assets/images/2.png",
        ),
        Product(
            id: "2",
            productName: "MultiColored Cushion Chair",
            price: "7.00",
            image: "assets/images/4.jpg",
            isCustomizable: true),
        Product(
            id: "3",
            productName: "Brown Cushion Chair",
            price: "8.00",
            image: "assets/images/8.png",
            isCustomizable: true),
        Product(
          id: "4",
          productName: "Blue Chair with leg rest",
          price: "12.00",
          image: "assets/images/9.png",
        ),
        Product(
          id: "5",
          productName: "Green Cushion Chair",
          price: "10.00",
          image: "assets/images/1.png",
        ),
        Product(
            id: "6",
            productName: "Single sheet Chair",
            price: "3.00",
            image: "assets/images/10.png",
            isCustomizable: true)
      ]),
      Category(title: "Arm Chair", icon: "assets/icons/sofa.svg", products: [
        Product(
          id: "7",
          productName: "Gray Single sheet Armchair",
          price: "15.00",
          image: "assets/images/3.png",
        ),
        Product(
          id: "8",
          productName: "Nike Armchair (Blue)",
          price: "12.00",
          image: "assets/images/5.png",
        ),
        Product(
          id: "9",
          productName: "Peter England Armchair (White)",
          price: "12.00",
          image: "assets/images/6.png",
        ),
        Product(
          id: "10",
          productName: "Wooden decorated ArmChair",
          price: "12.00",
          image: "assets/images/11.png",
        ),
        Product(
          id: "11",
          productName: "Blue Chair",
          price: "7.00",
          image: "assets/images/12.png",
        ),
        Product(
          id: "12",
          productName: "Brown Cushion Chair",
          price: "8.00",
          image: "assets/images/8.png",
        ),
        Product(
          id: "13",
          productName: "Ash colored Chair with leg rest",
          price: "12.00",
          image: "assets/images/15.png",
        ),
      ]),
      Category(title: "Sofa", icon: "assets/icons/sofa_sleeper.svg", products: [
        Product(
          id: "14",
          productName: "Sofa Blue",
          price: "12.00",
          image: "assets/images/17.png",
        ),
        Product(
            id: "15",
            productName: "Sofa (Nike)",
            price: "12.00",
            image: "assets/images/18.png",
            isCustomizable: true),
        Product(
            id: "16",
            productName: "Sofa (White)",
            price: "12.00",
            image: "assets/images/19.png",
            isCustomizable: true),
      ]),
      Category(title: "Dress", icon: "assets/icons/pants.svg", products: [
        Product(
          id: "17",
          productName: "White Shirt",
          price: "12.00",
          image: "assets/images/product_0.png",
        ),
        Product(
          id: "18",
          productName: "Black T-shirt",
          price: "12.00",
          image: "assets/images/product_1.png",
        ),
        Product(
          id: "19",
          productName: "Green and white Shirt",
          price: "12.00",
          image: "assets/images/product_2.png",
        ),
        Product(
          id: "20",
          productName: "green T-shirt",
          price: "12.00",
          image: "assets/images/product_3.png",
        ),
      ]),
    ];
  }

  static CartModel getCartArray() {
    List<double> priceList = cartProducts.isNotEmpty
        ? cartProducts.map((e) => double.parse(e.price) * e.qunatity).toList()
        : [0];
    double productTotal = priceList.reduce((value, element) => value + element);
    double toPay = productTotal + 0;
    CartModel cartData = CartModel(
        productPay: productTotal, toPay: toPay, productList: cartProducts);
    return cartData;
  }

  static void addToCart(Product product) {
    List<Product> duplicate =
        cartProducts.where((element) => element.id == product.id).toList();
    if (duplicate.isEmpty) {
      cartProducts.add(product);
    } else {
      int index = cartProducts.map((e) => e.id).toList().indexOf(product.id);
      cartProducts[index].qunatity++;
    }
  }
}

class CartModel {
  double productPay;
  double toPay;
  List<Product> productList;

  CartModel(
      {required this.productPay,
      required this.toPay,
      required this.productList});
}
