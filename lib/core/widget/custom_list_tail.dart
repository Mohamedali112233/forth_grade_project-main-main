
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fourth_grade_project/core/constant.dart';

class CustomListTail extends StatelessWidget {
  CustomListTail({
    super.key,
    required this.color,
    required this.isPass,
    required this.title,
    required this.onTap,
    required this.startDate,
    required this.endDate,
    required this.name,
  });
  //dynamic data;
  Color color;
  bool isPass;
  String title;
  String name;
  String startDate;
  VoidCallback onTap;
  String endDate;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: Container(
          decoration: BoxDecoration(
            color: color, // Background color for the ListTile
            borderRadius: BorderRadius.circular(10), // Rounded corners
            border: Border.all(color: Colors.black),
          ), // Bor
          height: screenHeight * .2,
          width: screenWidth * .8,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * .02),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    isPass ? kSandWatchDone : kSandWatchRunning,
                    fit: BoxFit.cover,
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.18,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.05,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.059,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.052,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'start : $startDate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.048,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'end : $endDate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.048,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
