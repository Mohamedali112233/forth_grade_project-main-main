import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/core/widget/custom_list_tail.dart';
import 'package:fourth_grade_project/view/graduate_student/home/studant_graduate_home_controller.dart';
import 'package:get/get.dart';
import '../session_details/student_graduate_session_details_page.dart';

class StudentGraduateHomePage extends StatelessWidget {
  const StudentGraduateHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    StudentGraduateHomeController controller =
        Get.put(StudentGraduateHomeController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomHeaderText(text: 'HomeStudent'),
      SizedBox(
        height: screenHeight * .02,
      ),
      //todo: this session will be the nearest session from now اقرب سيشين لسه هتيجي فالمستقبل
      controller.nextSession == null
          ? Padding(
              padding: EdgeInsets.all(screenWidth * .03),
              child: Text(
                'There is no next session',
                style: TextStyle(
                    fontSize: screenHeight * .025,
                    color: const Color(0xff283238)),
              ),
            )
          : CustomListTail(
              onTap: () {
                Get.to(
                  StudentGraduateSessionDetailsPage(
                    onTap: () {
                      //todo: add here delete me from sessions functions and refresh the page after it
                    },
                    isPassed: false,
                    enrolledOrNot: true,
                    //todo: here add session details [sessionType,title,companyName,endIn,endInHour,speakerName,maximumAttendance,place,sessionDetails,startIn,startInHour]
                    sessionType: 'Session',
                    title: 'hi in programming',
                    companyName: 'Luxor FCI',
                    endInHour: '4:00 pm',
                    endIn: '2/7/2024',
                    speakerName: 'Dr.Ahmed',
                    applied: 27,
                    maximumAttendance: 30,
                    place: 'Luxor FCI',
                    sessionDetails: 'hi ',
                    startIn: '1/7/2024',
                    startInHour: '10:30 am',
                  ),
                );
              },
              color: kMainColor,
              title: 'hi in programming ',
              endDate: '2/7/2024',
              name: 'Dr.Ahmed',
              isPass: false,
              startDate: '1/7/2024',
            ),
      SizedBox(
        height: screenHeight * .02,
      ),
      //todo: this session will be the nearest past session from now اقرب سيشين خلصت فالماضي
      controller.pastSession == null
          ? Padding(
              padding: EdgeInsets.all(screenWidth * .03),
              child: Text(
                'There is no past session',
                style: TextStyle(
                    fontSize: screenHeight * .025,
                    color: const Color(0xff283238)),
              ),
            )
          : CustomListTail(
              onTap: () {
                Get.to(
                  StudentGraduateSessionDetailsPage(
                    //todo: leave on tap empty
                    onTap: () {},
                    isPassed: true,
                    //todo: here add session details [sessionType,title,companyName,endIn,endInHour,speakerName,maximumAttendance,place,sessionDetails,startIn,startInHour]
                    sessionType: 'info session',
                    title: 'hi in programming',
                    companyName: 'Luxor FCI',
                    endInHour: '4:00 pm',
                    endIn: '2/6/2024',
                    speakerName: 'Dr.mohamed',
                    applied: 10,
                    maximumAttendance: 15,
                    place: 'Luxor FCI',
                    sessionDetails: 'hi ',
                    startIn: '1/6/2024',
                    startInHour: '10:30 am',
                  ),
                );
              },
              color: kMainColor,
              title: 'welcome in programming',
              endDate: '2/6/2024',
              name: 'Dr.mohamed',
              isPass: true,
              startDate: '1/6/2024',
            ),
    ], imageName: kBookGlasses);
  }
}
