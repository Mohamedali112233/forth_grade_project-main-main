import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/data/auth/sighnup.dart';


import 'package:fourth_grade_project/core/functions/handingdatacontroller.dart';
import 'package:fourth_grade_project/view/graduate_student/home/student_graduate_home_page.dart';

import 'package:fourth_grade_project/view/login/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class StudentSignUpController extends GetxController {
  bool isSecure = true;
  bool isMale = true;
  //todo: use these 2 variables in the account data gender / selectedDate
  bool gender = true;
  DateTime? selectedDate;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  late TextEditingController  name;
  late TextEditingController  password;
  late TextEditingController  email;
  late TextEditingController  phone;
  late TextEditingController  national_id;
  late TextEditingController  GPA;
  
  late TextEditingController  male;
  late TextEditingController Grade;
  
  late StatusRequest statusRequest;

  SignupStudentData signupData = SignupStudentData(Get.find());

  List data = [];

  @override
  signUpStudent() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupData.postdata(
          name.text, password.text, email.text, phone.text,national_id.text,selectedDate.toString(), male.text,GPA.text,Grade.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
         // data.addAll(response['data']);
          Get.to(StudentGraduateHomePage() );
          
          print(".............................................ddddddddddddddddddddd");
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Phone Number Or Email Already Exists") ; 
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }
  @override
  void onInit() {
     name=TextEditingController();
     password=TextEditingController();
     email=TextEditingController();
     phone=TextEditingController();
     national_id=TextEditingController();
     GPA=TextEditingController();
     Grade=TextEditingController();
     
     male=TextEditingController();
     
     super.onInit();
  }
  
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    national_id.dispose();
    male.dispose();
    GPA.dispose();
    Grade.dispose();
    super.dispose();
  }
  void showPassword() {
    isSecure = !isSecure;
    update();
  }
  
  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.black, // Header background color
              onPrimary: Colors.white, // Header text color
              surface: kMainColor, // Background color of the date picker itself
              onSurface: Colors.black, // Text color of the date picker itself
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      update();
      // print(selectedDate);
    }
  }

  String date() {
    if (selectedDate != null) {
      return DateFormat('dd/MM/yyyy').format(selectedDate!);
    } else {
      return 'Enter National ID';
    }
    update();
  }
}
