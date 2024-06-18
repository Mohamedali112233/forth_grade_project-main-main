import 'package:flutter/cupertino.dart';
import 'package:fourth_grade_project/core/constant.dart';

class CustomLapelText extends StatelessWidget {
  const CustomLapelText({super.key, required this.label});
final String label;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return  Padding(
      padding:  EdgeInsets.only(left: screenWidth*.037,),
      child: Text(
        label,
        style: TextStyle(
          fontSize: screenWidth * .049,
          color:kDarkGreen,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
