import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/ViewModel.dart';

import '../../StarLinkColor.dart';
import '../../customWidgets/StarLinkText.dart';
import 'SearchBar.dart';

class Header extends StatelessWidget {
  Function onSearch;
  Function onTap;
  int quantity = ProductViewModel.getCartArray().productList.length;
  Header({
    Key? key,
    required this.onSearch,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  onTap();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: StarLinkColors.homePrimaryColor,
                  size: 20,
                )),
            StarLinkTextLabel(
              text: "Search",
              size: 18,
              color: StarLinkColors.homePrimaryColor,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            if (quantity > 0)
              Badge(
                badgeContent: StarLinkTextLabel(
                  text: "$quantity",
                  color: CupertinoColors.white,
                  size: 15,
                ),
                child: IconButton(
                    onPressed: () {
                      onTap();
                    },
                    icon: const Icon(
                      CupertinoIcons.cart,
                      color: StarLinkColors.homePrimaryColor,
                    )),
              )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        searchBar(
          onChanged: (value) {
            onSearch(value);
          },
        )
      ],
    );
  }
}
