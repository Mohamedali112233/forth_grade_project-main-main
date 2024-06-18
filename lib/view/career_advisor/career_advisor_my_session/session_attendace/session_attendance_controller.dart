import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/data/Sessios/addToattends.dart';
import 'package:fourth_grade_project/core/functions/handingdatacontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class SessionAttendanceController extends GetxController {
  var attendeesMembers = <Member>[].obs;
  var absenteesMembers = <Member>[].obs;
  var registeredMembers = <Member>[].obs;
  AddToattends addToattends =AddToattends(Get.find());
  late StatusRequest statusRequest;
   Future addToattend() async {
    statusRequest = StatusRequest.loading;
    var response = await addToattends.postDat("","","","") ;
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

         //requests.value = response['data'].map((json) =>  AcecptedUsersForSessios.fromJson(json)).toList();
          
          print("object......................................");
          
       // jobs.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ; 
      }
    }
   
    update();
  }
  @override
  void onInit() {
    super.onInit();
    attendeesMembers.addAll([
      Member(name: 'Mohammed AbdElftah'),
      Member(name: 'Soha Jamal'),
      Member(name: 'Mhmoud Al Aswany'),
    ]);

    absenteesMembers.addAll([
      Member(name: 'noora Al Aswany'),
    ]);

    registeredMembers.addAll([
      Member(name: 'Joseph Adel Adip', grade: '4th grade'),
      Member(name: 'Reem Ashraf', grade: 'graduate'),
      Member(name: 'george Adel Adip', grade: '4th grade'),
    ]);
  }

  void moveToAccepted(Member member) {
    registeredMembers.remove(member);
    attendeesMembers.add(member);
  }

  void moveToRefused(Member member) {
    registeredMembers.remove(member);
    absenteesMembers.add(member);
  }

  void moveToRequests(Member member, bool wasAccepted) {
    if (wasAccepted) {
      attendeesMembers.remove(member);
    } else {
      absenteesMembers.remove(member);
    }
    registeredMembers.add(member);
  }
}

class Member {
  final String name;
  final String? grade;

  Member({required this.name, this.grade});
}
