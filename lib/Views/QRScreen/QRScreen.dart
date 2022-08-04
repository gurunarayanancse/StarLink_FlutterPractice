import 'package:flutter/material.dart';

import 'SupportWidgets/QRBody.dart';
import 'SupportWidgets/QRHeader.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [QRHeader(), QRBody()],
        ),
      ),
    );
  }
}
