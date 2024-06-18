import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/data/Sessios/ApllayForSession.dart';
import 'package:fourth_grade_project/core/data/Sessios/ViewAdvisorSessions.dart';
import 'package:fourth_grade_project/core/data/Sessios/ViewAttedneceAdvisingSessions.dart';
import 'package:fourth_grade_project/core/data/Sessios/ViewRequstedAdvisingSessions.dart';
import 'package:fourth_grade_project/core/data/Sessios/session.dart';
import 'package:fourth_grade_project/core/functions/handingdatacontroller.dart';
import 'package:fourth_grade_project/core/services/setting_service.dart';
import 'package:fourth_grade_project/model/Session_Model.dart';
import 'package:fourth_grade_project/model/ViewAttedneceAdvisingSessionsModele.dart';
import 'package:fourth_grade_project/model/ViewRequstedAdvisingSessionModel.dart';
import 'package:fourth_grade_project/view/career_advisor/career_advisor_my_session/registerd_members/registered_members_page.dart';
import 'package:fourth_grade_project/view/career_advisor/career_advisor_my_session/session_attendace/session_attendance_page.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
class CareerAdvisorMySessionsController extends GetxController {//todo : get the data from database and add it into this list sessions after declared session model
     RxList<dynamic> sessions = <dynamic>[].obs;
     RxList<dynamic> viewRequstedAdvisSessions = <dynamic>[].obs;
     RxList<dynamic> ViewAttednece= <dynamic>[].obs;
  var isLoading = true.obs;
  SettingServices settingServices=Get.find();

 ViewAdvisorAtSession getSessionsData = ViewAdvisorAtSession(Get.find());
 ViewRequstedAdvisingSessions _viewRequstedAdvisingSessions=ViewRequstedAdvisingSessions(Get.find());
 ViewAttedneceAdvisingSessionsM viewAttedneceAdvisingSessions=ViewAttedneceAdvisingSessionsM(Get.find());


  //List data = [];

  late StatusRequest statusRequest;
 DateTime now = DateTime.now();
 Future getData() async {
    statusRequest = StatusRequest.loading;
    var response = await getSessionsData.postData(settingServices.share.getInt("id")!.toString()) ;
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

         sessions.value = response['data'].map((json) =>  SessionModel.fromJson(json)).toList();

       // jobs.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ; 
      }
    }
    print("............................................$sessions");
    update();
  }
  Future viewRequstedAdvisingSessions() async {
    statusRequest = StatusRequest.loading;
    var response = await _viewRequstedAdvisingSessions.postDat(settingServices.share.getInt("sessionId")!.toString()) ;
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

         viewRequstedAdvisSessions.value = response['data'].map((json) =>  ViewRequstedAdvisingSessionModel.fromJson(json)).toList();
          Get.to(const RegisteredMembersPage());
          print("object......................................");
       // jobs.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ; 
      }
    }
    print("............................................${viewRequstedAdvisSessions[0]}");
    update();
  }
Future GetAttednec() async {
    statusRequest = StatusRequest.loading;
    var response = await viewAttedneceAdvisingSessions.postDat(settingServices.share.getInt("sessionId")!.toString()) ;
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

         ViewAttednece.value = response['data'].map((json) =>  ViewRequstedAdvisingSessionModel.fromJson(json)).toList();
          
          print("object......................................");
          Get.to(const SessionAttendancePage());
       // jobs.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ; 
      }
    }
    print("............................................${ViewAttednece[0]}");
    update();
  }
String ddmmyyyy(DateTime dateTime) {
  

  // Format as dd/MM/yyyy
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  print('Formatted Date: $formattedDate'); // Output: Formatted Date: 13/06/2024 (example)

  return formattedDate;
}
String hhmm(DateTime dateTime) {
 

   String formattedTime = DateFormat('HH:mm').format(dateTime);
  print('Formatted Time: $formattedTime'); // Output: Formatted Time: 14:30 (example)

  return formattedTime;
}

  @override
  void onInit() async{
    await Future.delayed(const Duration(seconds: 2)); 
    // Simulate a network delay
    await getData();
    super.onInit();
    isLoading.value=false;
    //todo: change this bart with fetching data
  }
  
  }
//todo : don't forget to change this



