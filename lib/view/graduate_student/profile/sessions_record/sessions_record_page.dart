import 'package:flutter/cupertino.dart';
import 'package:fourth_grade_project/core/constant.dart';

import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:fourth_grade_project/core/widget/custom_session_data_container.dart';
import 'package:fourth_grade_project/view/graduate_student/profile/sessions_record/sessions_record_controller.dart';
import 'package:get/get.dart';

import '../../session_details/student_graduate_session_details_page.dart';

class StudentGraduateSessionRecordPage extends StatelessWidget {
  const StudentGraduateSessionRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    StudentGraduateSessionRecordController controller =
        Get.put(StudentGraduateSessionRecordController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    return CustomScaffold(
      inNavigatorButton: false,
      widgetList: [
        SizedBox(
          height: screenHeight * .025,
        ),
        const CustomHeaderText(text: 'Events Record'),
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
                child: Text('There are no sessions that you are enrolled in.'),
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
                    return CustomSessionDataContainer(
                      inFuture: !session.isPassed,
                      type: session.sessionType,
                      onTap: () {
                        Get.to(StudentGraduateSessionDetailsPage(
                          onTap: () {
                            //todo: if the session is bast this on tap let it empty
                            //todo: if the session didnt start yet and didnt passed add here the delete me from session
                            //todo :and make update to or reload to this page to refresh the sessions
                          },
                          isPassed: session.isPassed,
                          enrolledOrNot: session.enrolledOrNot,
                          sessionType: session.sessionType,
                          speakerName: session.speakerName,
                          title: session.title,
                          startIn: session.startIn,
                          endIn: session.endIn,
                          startInHour: session.startInHour,
                          endInHour: session.endInHour,
                          sessionDetails: session.sessionDetails,
                          place: session.place,
                          maximumAttendance: session.maximumAttendance,
                          applied: session.applied,
                          companyName: session.companyName,
                        ));
                      },
                      sessionSpeaker: session.speakerName,
                      sessionTitle: session.title,
                      startIn: session.startIn,
                      endIn: session.endIn,
                      startInHour: session.startInHour,
                      endInHour: session.endInHour,
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
      imageName: kSpeakerInSession,
    );
  }
}
