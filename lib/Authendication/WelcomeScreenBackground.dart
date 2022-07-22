import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginMainScreenBackgroundView extends StatelessWidget {
  Widget bodyContent;
  Size? screenSize;
  Image? topLeftImage;
  Image? bottomLeftImage;
  Image? topRightImage;
  Image? bottomRightImage;
  LoginMainScreenBackgroundView(
      {Key? key,
      required this.bodyContent,
      this.screenSize,
      this.topLeftImage,
      this.bottomLeftImage,
      this.topRightImage,
      this.bottomRightImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: screenSize?.width,
        height: screenSize?.height,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          if (topLeftImage != null) ...[
            Positioned(left: 0, top: 0, child: topLeftImage!),
          ],
          if (topRightImage != null) ...[
            Positioned(right: 0, top: 0, child: topRightImage!),
          ],
          if (bottomLeftImage != null) ...[
            Positioned(
              left: 0,
              bottom: 0,
              child: bottomLeftImage!,
            )
          ],
          if (bottomRightImage != null) ...[
            Positioned(right: 0, bottom: 0, child: bottomRightImage!),
          ],
          bodyContent
        ]));
  }
}
