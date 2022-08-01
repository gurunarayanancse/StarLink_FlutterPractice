import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:star_link/Models/Category.dart';
import 'package:star_link/customWidgets/StarLinkText.dart';

class CategoryListView extends StatefulWidget {
  Iterable<Category> categories;
  Function onTapped;
  CategoryListView({Key? key, required this.categories, required this.onTapped})
      : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
            widget.categories.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CategoryCard(
                title: widget.categories.elementAt(index).title,
                icon: widget.categories.elementAt(index).icon,
                onPressed: () {
                  widget.onTapped(index);
                },
              ),
            ),
          )),
        ));
  }
}

class CategoryCard extends StatefulWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const CategoryCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset(
                  widget.icon,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              StarLinkTextLabel(
                text: widget.title,
                size: 14,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ));
  }
}
