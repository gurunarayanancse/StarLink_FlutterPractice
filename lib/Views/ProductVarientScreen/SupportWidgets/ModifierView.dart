import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/Helpers/StarLinkColor.dart';
import 'package:star_link/Views/customWidgets/StarLinkText.dart';

import '../../../Models/Product.dart';

class ModifierView extends StatefulWidget {
  final Product productInfo;
  Function onChangeColor;
  Function onchangeSize;
  ModifierView({
    Key? key,
    required this.productInfo,
    required this.onChangeColor,
    required this.onchangeSize,
  }) : super(key: key);

  @override
  State<ModifierView> createState() => _ModifierViewState();
}

class _ModifierViewState extends State<ModifierView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((widget.productInfo.size ?? []).isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: StarLinkTextLabel(
                      text: "Select Size",
                      fontWeight: FontWeight.w600,
                      size: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          (widget.productInfo.size ?? []).length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.productInfo.selectedSizeIndex = index;
                              widget.onchangeSize(index);
                            });
                          },
                          child: Container(
                            width: 42,
                            height: 42,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: index ==
                                        widget.productInfo.selectedSizeIndex
                                    ? StarLinkColors.homePrimaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: index ==
                                        widget.productInfo.selectedSizeIndex
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color:
                                            StarLinkColors.homePrimaryColor)),
                            child: Center(
                              child: StarLinkTextLabel(
                                text: widget.productInfo.size?[index] ?? "",
                                fontWeight: index ==
                                        widget.productInfo.selectedSizeIndex
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: index ==
                                        widget.productInfo.selectedSizeIndex
                                    ? CupertinoColors.white
                                    : StarLinkColors.homePrimaryColor,
                                size: 15,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          const SizedBox(
            height: 15,
          ),
          if (widget.productInfo.bgColor.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: StarLinkTextLabel(
                      text: "Select Color",
                      fontWeight: FontWeight.w600,
                      size: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          (widget.productInfo.bgColor).length, (index) {
                        return Stack(
                          children: [
                            if (widget.productInfo.selectedColorIndex == index)
                              Container(
                                margin: const EdgeInsets.all(5),
                                width: 35,
                                height: 35,
                                child: const Icon(
                                  Icons.check,
                                ),
                              ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.productInfo.selectedColorIndex = index;
                                  widget.onChangeColor(
                                      widget.productInfo.selectedColorIndex);
                                });
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: widget.productInfo.bgColor[index]
                                      .withOpacity(index ==
                                              widget.productInfo
                                                  .selectedColorIndex
                                          ? 0.4
                                          : 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
