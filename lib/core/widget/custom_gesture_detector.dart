import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:flutter_svg/svg.dart';

class CustomGestureDetector extends StatelessWidget {
  CustomGestureDetector(
      {super.key,
      required this.fontSize,
      required this.onTap,
      required this.title});
  double fontSize;
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * .04),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            color: Colors.transparent,  // Make sure the Container has a color or it won't register taps outside its children
            height: screenHeight * .05,
            width: screenWidth * .8,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: fontSize, color: Colors.black,fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                SvgPicture.asset(
                  kArrowPointToRight,
                  height: screenHeight * .024,
                )
              ],
            )),
      ),
    );
  }
}
