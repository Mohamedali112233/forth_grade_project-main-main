import 'package:flutter/cupertino.dart';

import '../constant.dart';

class CustomJobDataContainer extends StatelessWidget {
  CustomJobDataContainer(
      {super.key,
      required this.inFuture,
      required this.onTap,
      required this.jobTitle,
      required this.companyName,
      required this.jobType,
      required this.endIn,
      required this.endInHour});
  final bool inFuture;
  final String jobTitle;
  final String companyName;
  final String jobType;
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
                    jobTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * .06,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    jobType,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * .06,
                    ),
                  ),
                  SizedBox(height: screenWidth * .01),
                  Text(
                    companyName,
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
