import 'package:flutter/material.dart';

import '../constant.dart';

class CustomSessionDataContainerCareerAdvisor extends StatelessWidget {
  CustomSessionDataContainerCareerAdvisor({
    super.key,
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
  //Color color;
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
    return Padding(
      padding: EdgeInsets.all(screenWidth * .02),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: !isPass
                  ? kMainColor
                  : kGrayButton, // Light green background color
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * .025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * .06,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'Applied : $applied / $maximumAttendance',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * .06,
                    ),
                  ),
                  SizedBox(height: screenWidth * .01),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * .045,
                    ),
                  ),
                  SizedBox(height: screenWidth * .01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start: $startIn',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * .043,
                        ),
                      ),
                      Text(
                        startInHour,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * .043,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * .01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'End:   $endIn',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * .043,
                        ),
                      ),
                      Text(
                        endInHour,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * .043,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
