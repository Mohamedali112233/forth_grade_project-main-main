import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/data/Sessios/AcecptedUsersForSessios.dart';
import 'package:fourth_grade_project/core/functions/handingdatacontroller.dart';
import 'package:get/get.dart';

class RegisteredMembersController extends GetxController {
  //todo : arrange them when you create user model
  var acceptedMembers = <Member>[].obs;
  var refusedMembers = <Member>[].obs;
  var requests = <Member>[].obs;
   AcecptedUsersForSessios acecptedUsersForSessios=AcecptedUsersForSessios(Get.find());

  //List data = [];

  late StatusRequest statusRequest;
   Future AcecptedUsersForSessio() async {
    statusRequest = StatusRequest.loading;
    var response = await acecptedUsersForSessios.postDat("","","","") ;
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
    acceptedMembers.addAll([
      Member(name: 'Mohammed AbdElftah'),
      Member(name: 'Soha Jamal'),
      Member(name: 'Mhmoud Al Aswany'),
    ]);

    refusedMembers.addAll([
      Member(name: 'noora Al Aswany'),
    ]);

    requests.addAll([
      Member(name: 'Joseph Adel Adip', grade: '4th grade'),
      Member(name: 'Reem Ashraf', grade: 'graduate'),
      Member(name: 'george Adel Adip', grade: '4th grade'),
    ]);
  }

  void moveToAccepted(Member member) {
    requests.remove(member);
    acceptedMembers.add(member);
  }

  void moveToRefused(Member member) {
    requests.remove(member);
    refusedMembers.add(member);
  }

  void moveToRequests(Member member, bool wasAccepted) {
    if (wasAccepted) {
      acceptedMembers.remove(member);
    } else {
      refusedMembers.remove(member);
    }
    requests.add(member);
  }
}
class Member {
  final String name;
  final String? grade;

  Member({required this.name, this.grade});
}