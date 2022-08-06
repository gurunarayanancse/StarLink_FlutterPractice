import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_link/customWidgets/RoundedTextField.dart';

class searchBar extends StatefulWidget {
  Function onChanged;
  searchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    // var filterButton = Container(
    //   margin: const EdgeInsets.all(5),
    //   width: 45,
    //   height: 45,
    //   decoration: BoxDecoration(
    //       color: StarLinkColors.homePrimaryColor,
    //       borderRadius: BorderRadius.circular(10),
    //       boxShadow: const [
    //         BoxShadow(
    //           color: StarLinkColors.homePrimaryColor,
    //           blurRadius: 2,
    //         )
    //       ]),
    //   child: MaterialButton(
    //     child: SvgPicture.asset(
    //       "assets/icons/Filter.svg",
    //       color: Colors.white,
    //     ),
    //     onPressed: () {},
    //   ),
    // );
    return RoundedTextField(
      hintText: "Search here.",
      margin: const EdgeInsets.all(0),
      icon: Icons.search,
      textColor: Colors.black,
      backgroundColor: Colors.white,
      borderRadius: 10,
      padding: const EdgeInsets.only(left: 10),
      boxShadow: const [
        BoxShadow(
          color: CupertinoColors.lightBackgroundGray,
          blurRadius: 3,
        )
      ],
      onChange: (value) {
        widget.onChanged(value);
      },
      // suffix: filterButton
    );
  }
}
