import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/custom_elevated_button.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/view/graduate_student/session_details/student_graduate_session_details_controller.dart';
import 'package:get/get.dart';

import '../../../../core/widget/custom_data_view_box.dart';

class StudentGraduateSessionDetailsPageWith extends StatelessWidget {
  StudentGraduateSessionDetailsPageWith({
    super.key,
    required this.sessionType,
    required this.speakerName,
    required this.title,
    required this.startIn,
    required this.endIn,
    required this.startInHour,
    required this.endInHour,
    required this.sessionDetails,
    required this.place,
    required this.companyName,
    required this.maximumAttendance,
  });
  String sessionType;
  String speakerName;
  String title;
  String companyName;
  String startIn;
  String endIn;
  String startInHour;
  String endInHour;
  String sessionDetails;
  String place;
  int maximumAttendance;
  @override
  Widget build(BuildContext context) {
    StudentGraduateSessionDetailsController controller = Get.put(StudentGraduateSessionDetailsController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      CustomHeaderText(text: '$sessionType Details'),
      SizedBox(
        height: screenHeight * .01,
      ),
      CustomDataViewBox(
        content: title,
        label: '$sessionType title',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: '$startIn  $startInHour',
        label: 'Start In',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: '$endIn  $endInHour',
        label: 'End In',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: speakerName,
        label: 'Speaker Name',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: place,
        label: 'Place',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: companyName,
        label: 'Company name',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: maximumAttendance.toString(),
        label: 'Maximum Attendance',
        function: () {},
        canModify: false,
      ),
      CustomDataViewBox(
        content: sessionDetails,
        label: '$sessionType Note',
        function: () {},
        canModify: false,
      ),
      SizedBox(height: screenHeight * .02,),
      //todo: add these 2 relation here don't forget to remove the 'True'
      if(//todo: user is student and graduate && the session does not start yet
      true)Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * .1, 0,
            screenWidth * .1, screenHeight * .03),
        child: CustomElevatedButton(
          color: kMainColor,
          textColor: Colors.black,
          onTap: () {
            //todo: here add the function that delete graduate or student from the session
          },
          hasText: true,
          fontWeight: FontWeight.w400,
          text: 'Enroll me into session',
          minimanH: screenHeight * .06,
          minimanW: screenWidth * .5,
        ),
      )
    ], imageName: kSpeakerInSession);
  }
}
