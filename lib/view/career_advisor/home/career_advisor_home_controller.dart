import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/data/Sessios/session.dart';
import 'package:fourth_grade_project/core/functions/handingdatacontroller.dart';
import 'package:fourth_grade_project/core/services/setting_service.dart';
import 'package:fourth_grade_project/model/Session_Model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../graduate_student/profile/sessions_record/sessions_record_controller.dart';

class CareerAdvisorHomeController extends GetxController {
  Session? nextSession;
  Session? pastSession;
    RxList<dynamic> sessions = <dynamic>[].obs;
  var isLoading = true.obs;
  SettingServices settingServices=Get.find();

 GetSessionsData getSessionsData = GetSessionsData(Get.find());


  //List data = [];

  late StatusRequest statusRequest;
 DateTime now = DateTime.now();
 Future getData() async {
    statusRequest = StatusRequest.loading;
    var response = await getSessionsData.getData();
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
}
