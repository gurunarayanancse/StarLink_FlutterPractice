import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Views/customWidgets/Toast.dart';
import 'StarLinkColor.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPassword() {
    return length >= 5;
  }
}

void showToast(BuildContext context, String text, Duration duration) {
  FToast fToast = FToast();
  fToast.init(context);
  fToast.showToast(
      child: CustomToast(
        backgroundColor: StarLinkColors.homePrimaryColor,
        text: text,
        leftIcon: null,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: duration);
}

String idGenerator() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}
