import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/Models/Product.dart';
import 'package:star_link/Views/ProductVarientScreen/SupportWidgets/ModifierView.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

class ProductInformationView extends StatefulWidget {
  // int imageIndex = 0;
  // int selectedSizeIndex = 0;
  final Product product;
  Function onChangeColor;
  Function onChangeSize;
  ProductInformationView({
    Key? key,
    required this.product,
    required this.onChangeColor,
    required this.onChangeSize,
  }) : super(key: key);

  @override
  State<ProductInformationView> createState() => _ProductInformationViewState();
}

class _ProductInformationViewState extends State<ProductInformationView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductBasicInfo(
          productInfo: widget.product,
        ),
        Container(
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          height: 225,
          decoration: BoxDecoration(
              color: widget.product.bgColor[widget.product.selectedColorIndex]
                  .withOpacity(0.5),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              widget.product.image[widget.product.selectedColorIndex],
            ),
          ),
        ),
        ModifierView(
          productInfo: widget.product,
          onChangeColor: (index) {
            setState(() {
              widget.product.selectedColorIndex = index;
              widget.onChangeColor(index);
            });
          },
          onchangeSize: (index) {
            setState(() {
              widget.product.selectedSizeIndex = index;
              widget.onChangeSize(index);
            });
          },
        )
      ],
    );
  }
}

class ProductBasicInfo extends StatelessWidget {
  final Product productInfo;
  const ProductBasicInfo({Key? key, required this.productInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StarLinkTextLabel(
          text: productInfo.productName,
          fontWeight: FontWeight.w600,
          size: 16,
        ),
        const SizedBox(
          height: 10,
        ),
        StarLinkTextLabel(
          text: "\$${productInfo.price}",
          fontWeight: FontWeight.w600,
          size: 16,
        )
      ],
    );
  }
}
