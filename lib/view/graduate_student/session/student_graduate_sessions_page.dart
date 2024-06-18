import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/data/Sessios/ApllayForSession.dart';
import 'package:fourth_grade_project/core/data/Sessios/CheckRegisterOrNot.dart';
import 'package:fourth_grade_project/core/functions/handingdatacontroller.dart';
import 'package:fourth_grade_project/core/services/setting_service.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/view/graduate_student/session/student_graduate_sessions_controller.dart';
import 'package:get/get.dart';
import '../../../core/widget/custom_header_text.dart';
import '../../../core/widget/custom_session_data_container.dart';
import '../session_details/student_graduate_session_details_page.dart';

class StudentGraduateSessionsPage extends StatelessWidget {
  
  const StudentGraduateSessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingServices settingServices=Get.find();
     ApllaySessions apllaySessions=ApllaySessions(Get.find());
     ChickRigsterAtSession chickRigsterAtSession=ChickRigsterAtSession(Get.find());

  //List data = [];

  late StatusRequest statusRequest;
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    StudentGraduateSessionsController controller =
        Get.put(StudentGraduateSessionsController());
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .025,
      ),
      const CustomHeaderText(text: 'Available Events'),
      Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: DropdownButtonFormField<int>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          value: 1,
          items: controller.dropdownMenuItems,
          onChanged: (value) {
            // todo: Handle the change here if needed
            // TODO : DON'T FORGET TO UPDATE THE LIST VALUE WITH THE SEARCH RESULT TO MAKE Obx UPDATE
            controller.update();
          },
        ),
      ),
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
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * .1),
                child: Text(
                  'There are no sessions added yet.',
                  style: TextStyle(fontSize: screenHeight * .025),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: screenHeight * .51,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.sessions.length,
                itemBuilder: (context, index) {
                  var session = controller.sessions[index];
                  return CustomSessionDataContainer(
                    inFuture: session.sessionEndTime!.isAfter(controller.now),
                    type: session.sessionTybe!,
                    onTap: () async{
                       settingServices.share.setInt("seion_id",session.seionId);
                     
                                 
                          statusRequest = StatusRequest.loading;
                            var response = await chickRigsterAtSession.postData(
                             session.seionId!.toString() ,
                             settingServices.share.getInt("id")!.toString(), 
                             settingServices.share.getString("user_type")!
                              );
                            print("=============================== Controller $response ");
                            statusRequest = handlingData(response);
                           if (StatusRequest.success == statusRequest) {
                            if (response['status'] == "success") {
                              print("enrolment.....................");
                               settingServices.share.setBool("enrolledOrNot",false);
                               
                               } else {
                                 settingServices.share.setBool("enrolledOrNot",true);
                                       statusRequest = StatusRequest.failure ; 
                                     }
                                       }
                                      
                                          
                                          
                      Get.to(StudentGraduateSessionDetailsPage(
                            
                        onTap: () async{ 
                          print(".....................");
                          if(!settingServices.share.getBool("enrolledOrNot")!){
                                
                            
                           statusRequest = StatusRequest.loading;
                            var response = await apllaySessions.postData(
                             settingServices.share.getInt("seion_id")!.toString() ,
                             settingServices.share.getInt("id")!.toString(), 
                             settingServices.share.getString("user_type")!
                              );
                            print("=============================== Controller $response ");
                            statusRequest = handlingData(response);
                           if (StatusRequest.success == statusRequest) {
                            if (response['status'] == "success") {
                              print("Regustrd suscecfuly");
                               } else {
                                 print("Regustrd failuair");
                                     statusRequest = StatusRequest.failure ; 
                                     }
                                       }
                                      
                                          
                                          
                          }else{
                             print("Cancle................................");
                          }
                          //todo: if the session is bast this on tap let it empty
                          //todo: if the session didnt start yet and didnt passed add here the delete me from session
                          //todo: if the student or graduate want to   apply into session add the function here
                          //todo :and make update to or reload to this page to refresh the sessions ==> make the fetch again and assign the value to the RxList to reload the page
                        },
                        isPassed: !session.sessionEndTime!.isAfter(controller.now),
                        
                        enrolledOrNot:settingServices.share.getBool("enrolledOrNot")! ,
                        sessionType: session.sessionTybe!,
                        speakerName: session.speaker,
                        title: session.sessionTitle!,
                        startIn: controller.ddmmyyyy(session.sessionStartTime!),
                        endIn: controller.ddmmyyyy(session.sessionEndTime!),
                        startInHour: controller.hhmm(session.sessionStartTime!),
                        endInHour: controller.hhmm(session.sessionEndTime!),
                        sessionDetails: session.sessionDetiels!,
                        place: session.sessionPlase,
                        applied: session.studintEnroll!,
                        maximumAttendance: session.maxStudint!,
                        companyName: session.employerName,
                      ));
                    },
                    sessionSpeaker: session.speaker!,
                    sessionTitle: session.sessionTitle!,
                    startIn: controller.ddmmyyyy(session.sessionStartTime!),
                    endIn: controller.ddmmyyyy(session.sessionEndTime!),
                    startInHour: controller.hhmm(session.sessionStartTime!),
                    endInHour: controller.hhmm(session.sessionEndTime!),
                  );
                },
              ),
            );
          }
        },
      ),
    ], imageName: kSpeakerInSession);
  }
}
