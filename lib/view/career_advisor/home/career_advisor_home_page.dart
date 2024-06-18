import 'package:flutter/cupertino.dart';
import 'package:fourth_grade_project/core/widget/career_advisor_custom_list_tail.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../../../core/widget/custom_header_text.dart';
import '../../../core/widget/custom_lapel_text.dart';
import '../career_advisor_my_session/career_advisor_mysession_page.dart';
import '../career_advisor_my_session/registerd_members/registered_members_page.dart';
import '../career_advisor_my_session/session_attendace/session_attendance_page.dart';
import 'career_advisor_home_controller.dart';

class CareerAdvisorHomePage extends StatelessWidget {
  const CareerAdvisorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CareerAdvisorHomeController controller =
        Get.put(CareerAdvisorHomeController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomHeaderText(text: 'My Appointments'),
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomLapelText(
        label: 'My next session',
      ),
      controller.nextSession != null
          ? Padding(
              padding: EdgeInsets.all(screenWidth * .03),
              child: Text(
                'There is no next session',
                style: TextStyle(
                    fontSize: screenHeight * .025,
                    color: const Color(0xff283238)),
              ),
            )
          : CareerAdvisorCustomListTail(
              startIn: '10/7/2024',
              startInHour: '10:30',
              //todo: this session will be the nearest session from now اقرب سيشين لسه هتيجي فالمستقبل
              color: kMainColor,
              isPass: false,
              title: 'Introduction to Programming',
              onTap: () {
                Get.to(
                  CareerAdvisorMySessionPage(
                    sessionType: 'work shop',
                    applied: 1,
                    startInHour: '10:10',
                    sessionDetails: '',
                    place: '',
                    maximumAttendance: 5,
                    speakerName: 'user name',
                    endInHour: '5:30',
                    companyName: '',
                    title: 'title',
                    attendanceOnTap: () {
                      Get.to(const SessionAttendancePage());
                    },
                    endIn: '15/7/2024 ',
                    startIn: '10/7/2024',
                    registeredMemberOnTap: () {
                      Get.to(const RegisteredMembersPage());
                    },
                    isPassed: false,
                  ),
                );
              },
              endIn: '15/7/2024',
              endInHour: 'endDate',
              applied: 1,
              maximumAttendance: 5),
      SizedBox(
        height: screenHeight * .02,
      ),
      const CustomLapelText(
        label: 'My last session',
      ),
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
          : CareerAdvisorCustomListTail(
              startIn: '10/6/2024',
              startInHour: '10:30',
              endIn: '15/7/2024',
              endInHour: 'endDate',
              applied: 1,
              maximumAttendance: 5,
              //todo: this session will be the nearest past session from now اقرب سيشين خلصت فالماضي
              color: kMainColor,
              isPass: false,
              title: 'title',
              onTap: () {
                Get.to(
                  CareerAdvisorMySessionPage(
                    sessionType: 'work shop',
                    applied: 1,
                    startInHour: '10:10',
                    sessionDetails: '',
                    place: '',
                    maximumAttendance: 5,
                    speakerName: 'user name',
                    endInHour: '5:30',
                    companyName: '',
                    title: 'title',
                    attendanceOnTap: () {},
                    endIn: '15/7/2024',
                    startIn: '10/7/2024',
                    registeredMemberOnTap: () {},
                    isPassed: true,
                  ),
                );
              },
            ),
    ], imageName: kBookGlasses);
  }
}
