import 'dart:ui';

import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/custom_elevated_button.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/view/graduate_student/session_details/student_graduate_session_details_controller.dart';
import 'package:get/get.dart';

import '../../../../core/widget/custom_data_view_box.dart';

class StudentGraduateSessionDetailsPage extends StatelessWidget {
  StudentGraduateSessionDetailsPage({
    super.key,
    required this.sessionType,
    required this.speakerName,
    required this.title,
    required this.startIn,
    required this.endIn,
    required this.onTap,
    required this.startInHour,
    required this.endInHour,
    required this.sessionDetails,
    required this.place,
    required this.applied,
    this.isPassed = true,
    this.isCareerAdvisor = false,
    this.enrolledOrNot = false,
    required this.companyName,
    required this.maximumAttendance,
  });
  dynamic sessionType;
  dynamic speakerName;
  dynamic title;
  dynamic companyName;
  dynamic startIn;
  dynamic endIn;
  dynamic startInHour;
  dynamic endInHour;
  dynamic sessionDetails;
  dynamic place;
  dynamic applied;
  dynamic maximumAttendance;
  dynamic isPassed;
  bool isCareerAdvisor;
  dynamic enrolledOrNot;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    StudentGraduateSessionDetailsController controller =
        Get.put(StudentGraduateSessionDetailsController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
        inNavigatorButton: false,
        widgetList: [
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
            content: speakerName!,
            label: 'Speaker Name',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: place!,
            label: 'Place',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: companyName==null?"":companyName,
            label: 'Company name',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: 'Applied : $applied / $maximumAttendance',
            label: 'Maximum Attendance',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: sessionDetails!,
            label: '$sessionType Note',
            function: () {},
            canModify: false,
          ),
          SizedBox(
            height: screenHeight * .02,
          ),

          isPassed! || isCareerAdvisor
              ? SizedBox(
                  height: screenHeight * .04,
                )
              : enrolledOrNot!
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth * .1, 0,
                          screenWidth * .1, screenHeight * .03),
                      child: CustomElevatedButton(
                        color: kMainColor,
                        textColor: Colors.black,
                        onTap: onTap,
                        hasText: true,
                        fontWeight: FontWeight.w400,
                        text: 'Cansel My Request',
                        minimanH: screenHeight * .06,
                        minimanW: screenWidth * .5,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth * .1, 0,
                          screenWidth * .1, screenHeight * .03),
                      child: CustomElevatedButton(
                        color: kMainColor,
                        textColor: Colors.black,
                        onTap: onTap,
                        hasText: true,
                        fontWeight: FontWeight.w400,
                        text: 'Enroll Me',
                        minimanH: screenHeight * .06,
                        minimanW: screenWidth * .5,
                      ),
                    ),
        ],
        imageName: kSpeakerInSession);
  }
}
