import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:get/get.dart';
import '../../../../core/widget/custom_header_text.dart';
import '../../../../core/widget/custom_session_data_container_career_advisor.dart';
import '../../career_advisor_my_session/career_advisor_mysession_page.dart';
import '../../career_advisor_my_session/registerd_members/registered_members_page.dart';
import '../../career_advisor_my_session/session_attendace/session_attendance_page.dart';
import 'career_advisor_sessions_controller.dart';

class CareerAdvisorMySessionsPage extends StatelessWidget {
  const CareerAdvisorMySessionsPage({super.key});

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
            height: screenHeight * .025,
          ),
          const CustomHeaderText(text: 'My Sessions'),
          Obx(
            () {
              if (controller.isLoading.value) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * .3,
                      ),
                      CircularProgressIndicator(
                        color: kMainButton, // Use the main color
                      ),
                    ],
                  ),
                );
              } else if (controller.sessions.isEmpty) {
                return const Center(
                  child: Text('There are no sessions that you are created in.'),
                );
              } else {
                return SizedBox(
                  height: screenHeight * .66,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.sessions.length,
                    itemBuilder: (context, index) {
                      var session = controller.sessions[index];
                      return CustomSessionDataContainerCareerAdvisor(
                          startInHour: controller.hhmm(session.sessionStartTime ?? DateTime.now()),
                          endInHour: controller.hhmm(session.sessionEndTime ?? DateTime.now()),
                          startIn: controller.ddmmyyyy(session.sessionStartTime ?? DateTime.now()),
                          endIn: controller.ddmmyyyy(session.sessionEndTime ?? DateTime.now()),
                          isPass: !(session.sessionEndTime?.isAfter(controller.now) ?? false),
                          title: session.sessionTitle ?? 'No Title',
                          onTap: () {
                            controller.settingServices.share.setInt("sessionId", session.seionId ?? 0);
                            Get.to(
                              CareerAdvisorMySessionPage(
                                sessionType: session.sessionTybe ?? 'Unknown',
                                applied: session.studintEnroll ?? 0,
                                startInHour: controller.hhmm(session.sessionStartTime ?? DateTime.now()),
                                sessionDetails: session.sessionDetiels ?? 'No Details',
                                place: session.sessionPlase ?? 'No Place',
                                maximumAttendance: session.maxStudint ?? 0,
                                speakerName: session.speaker ?? 'Unknown',
                                endInHour: controller.hhmm(session.sessionEndTime ?? DateTime.now()),
                                companyName: session.employerName ?? 'No Company',
                                title: session.sessionTitle ?? 'No Title',
                                endIn: controller.ddmmyyyy(session.sessionEndTime ?? DateTime.now()),
                                startIn: controller.ddmmyyyy(session.sessionStartTime ?? DateTime.now()),
                                isPassed: !(session.sessionEndTime?.isAfter(controller.now) ?? false),
                                attendanceOnTap: () async{
                                  
                                 await controller.GetAttednec();
                                },
                                registeredMemberOnTap: ()async {
                               
                                 await controller.viewRequstedAdvisingSessions();
                                },
                              ),
                            );
                          },
                          applied: session.studintEnroll ?? 0,
                          maximumAttendance: session.maxStudint ?? 0);
                    },
                  ),
                );
              }
            },
          ),
        ],
        imageName: kSpeakerInSession);
  }
}
