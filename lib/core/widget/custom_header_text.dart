 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constant.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Row(
      children: [
        SizedBox(width: screenWidth * .04),
        Expanded(
          child: Text(overflow: TextOverflow.clip,
            text,
            style: TextStyle(
                fontSize: screenWidth * .09,
                fontWeight: FontWeight.w700,
                color: kMainFontBold),
          ),
        ),
      ],
    );
  }
}
