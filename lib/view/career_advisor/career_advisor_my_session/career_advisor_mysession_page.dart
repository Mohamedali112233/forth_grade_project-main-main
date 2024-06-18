import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/custom_elevated_button.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:get/get.dart';
import '../../../../core/widget/custom_data_view_box.dart';
import '../profile/my_sessions/career_advisor_sessions_controller.dart';

class CareerAdvisorMySessionPage extends StatelessWidget {
  CareerAdvisorMySessionPage({
    super.key,
    required this.sessionType,
    required this.speakerName,
    required this.title,
    required this.startIn,
    required this.endIn,
    required this.attendanceOnTap,
    required this.registeredMemberOnTap,
    required this.startInHour,
    required this.endInHour,
    required this.sessionDetails,
    required this.place,
    required this.applied,
    this.isPassed = true,
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
  VoidCallback attendanceOnTap;
  VoidCallback registeredMemberOnTap;
  @override
  Widget build(BuildContext context) {
    CareerAdvisorMySessionsController controller =
        Get.put(CareerAdvisorMySessionsController());
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
                function: () {
                  //todo: here the function the will change the title after it rebuild (refetch) the screen
                },
                canModify: !isPassed,
              ),
              CustomDataViewBox(
                content: '$startIn  $startInHour',
                label: 'Start In',
                function: () {
                  //todo: here the function the will change the start time after it rebuild (refetch) the screen

                },
                canModify: !isPassed,
              ),
              CustomDataViewBox(
                content: '$endIn  $endInHour',
                label: 'End In',
                function: () {
                  //todo: here the function the will change the end time after it rebuild (refetch) the screen
                },
                canModify: !isPassed,
              ),
              CustomDataViewBox(
                content: speakerName!,
                label: 'Speaker Name',
                function: () {
                  //todo: here the function the will change the speaker name after it rebuild (refetch) the screen

                },
                canModify: !isPassed,
              ),
              CustomDataViewBox(
                content: place!,
                label: 'Place',
                function: () {
                  //todo: here the function the will change the place after it rebuild (refetch) the screen
                },
                canModify: !isPassed,
              ),
              CustomDataViewBox(
                content: companyName??"",
                label: 'Company name',
                function: () {
                  //todo: here the function the will change the Company name after it rebuild (refetch) the screen
                },
                canModify: !isPassed,
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
                function: () {
                  //todo: here the function the will change the sessionDetails after it rebuild (refetch) the screen
                },
                canModify: !isPassed,
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * .1, 0, screenWidth * .1, screenHeight * .03),
                child: CustomElevatedButton(
                  color: kMainColor,
                  textColor: Colors.black,
                  onTap: registeredMemberOnTap,
                  hasText: true,
                  fontWeight: FontWeight.w400,
                  text: 'Show Registered Member',
                  minimanH: screenHeight * .06,
                  minimanW: screenWidth * .5,
                ),
              ),
              isPassed
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth * .1, 0,
                          screenWidth * .1, screenHeight * .03),
                      child: CustomElevatedButton(
                        color: kMainColor,
                        textColor: Colors.black,
                        onTap: attendanceOnTap,
                        hasText: true,
                        fontWeight: FontWeight.w400,
                        text: 'Attendance',
                        minimanH: screenHeight * .06,
                        minimanW: screenWidth * .5,
                      ),
                    )
                  : SizedBox(
                      height: screenHeight * .04,
                    ),
            ],
            imageName: kSpeakerInSession);
  }
}
