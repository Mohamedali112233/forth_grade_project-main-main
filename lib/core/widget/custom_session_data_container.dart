import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';

class CustomSessionDataContainer extends StatelessWidget {
  CustomSessionDataContainer({
    super.key,
    required this.inFuture,
    required this.type,
    required this.sessionSpeaker,
    required this.sessionTitle,
    required this.startIn,
    required this.endIn,
    required this.startInHour,
    required this.onTap,
    required this.endInHour,
  });
  final bool inFuture;
  final String sessionTitle;
  final String sessionSpeaker;
  final String type;
  final String startIn;
  final String startInHour;
  final String endIn;
  final String endInHour;
  VoidCallback onTap;
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
              color: inFuture
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
                    sessionTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * .06,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    type,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * .06,
                    ),
                  ),
                  SizedBox(height: screenWidth * .01),
                  Text(
                    sessionSpeaker,
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
