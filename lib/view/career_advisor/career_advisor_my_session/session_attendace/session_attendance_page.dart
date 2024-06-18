import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/view/career_advisor/career_advisor_my_session/session_attendace/session_attendance_controller.dart';
import 'package:get/get.dart';

import '../../../../core/constant.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/custom_header_text.dart';
import '../registerd_members/registered_members_page.dart';

class SessionAttendancePage extends StatelessWidget {
  const SessionAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    SessionAttendanceController controller =
        Get.put(SessionAttendanceController());
    return CustomScaffold(
        inNavigatorButton: false,
        widgetList: [
          SizedBox(
            height: screenHeight * .025,
          ),
          const CustomHeaderText(text: 'Session Attendance'),
          SizedBox(
            height: screenHeight * .015,
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                      //todo: acceptedMembers الناس الي اتقبلو فالسيشين
                      '${controller.attendeesMembers.length} members accepted',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: screenHeight * .01),
                Obx(() => Card(
                      color: kMainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      //todo: this section off code arrange the students and graduate in acceptance list
                      child: Column(
                        //todo : member is the student or graduate
                        children: controller.attendeesMembers.map((member) {
                          return MemberTile(
                            //todo : parse the student/graduate name here
                            name: member.name,
                            onPressed: () =>
                                controller.moveToRequests(member, true),
                          );
                        }).toList(),
                      ),
                    )),
                SizedBox(height: screenHeight * .02),
                Obx(() => Text(
                      // todo : the number of refusedMembers
                      '${controller.absenteesMembers.length} members refused',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: screenHeight * .01),
                Obx(() => Card(
                      color: const Color(0xffF99A9A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        //todo: this arrange the refused member in refused list
                        children: controller.absenteesMembers.map((member) {
                          return MemberTile(
                            name: member.name,
                            onPressed: () =>
                                controller.moveToRequests(member, false),
                          );
                        }).toList(),
                      ),
                    )),
                SizedBox(height: screenHeight * .02),
                const Text(
                  'Requests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * .01),
                Obx(
                  () => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: controller.registeredMembers.map((member) {
                        return RequestTile(
                          //todo: here will parse name adn grade
                          name: member.name,
                          grade: member.grade,
                          onAccept: () => controller.moveToAccepted(member),
                          onRefuse: () => controller.moveToRefused(member),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                Center(
                  child: CustomElevatedButton(
                    color: kMainButton,
                    textColor: Colors.black,
                    onTap: () async{
                      await controller.addToattend();
                      //todo : here you will parse the submit function that will do 3 things
                      //todo : refuse student from session
                      //todo : accept student from session
                      //todo: update the session details and sent to student that he accepted or rejected
                      Get.back();
                    },
                    hasText: true,
                    text: 'Submit',
                    minimanW: screenWidth * .9,
                    minimanH: screenHeight * .05,
                  ),
                ),
              ],
            ),
          ),
        ],
        imageName: kEventAttendance);
  }
}
