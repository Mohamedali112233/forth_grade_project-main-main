import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fourth_grade_project/core/constant.dart';

class CareerAdvisorCustomListTail extends StatelessWidget {
  CareerAdvisorCustomListTail({
    super.key,
    required this.color,
    required this.isPass,
    required this.title,
    required this.onTap,
    required this.startIn,
    required this.startInHour,
    required this.endIn,
    required this.endInHour,
    required this.applied,
    required this.maximumAttendance,
  });
  //dynamic data;
  Color color;
  bool isPass;
  String title;
  int applied;
  int maximumAttendance;
  String startIn;
  String startInHour;
  VoidCallback onTap;
  String endIn;
  String endInHour;
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
                      'Applied : $applied / $maximumAttendance',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.052,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'start : $startIn  $startInHour',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.048,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'end : $endIn  $endInHour',
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
