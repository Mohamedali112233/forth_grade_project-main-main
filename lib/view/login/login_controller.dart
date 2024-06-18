import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/data/auth/login.dart';

import 'package:fourth_grade_project/core/functions/handingdatacontroller.dart';

import 'package:fourth_grade_project/core/services/setting_service.dart';
import 'package:fourth_grade_project/view/career_advisor/navigetor/career_advisor_navigetor.dart';
import 'package:fourth_grade_project/view/graduate_student/graduate_navigetor/graduate_navigator.dart';
import 'package:fourth_grade_project/view/graduate_student/student_navigator/student_navigator.dart';

import 'package:fourth_grade_project/view/login/login_page.dart';

import 'package:get/get.dart';

class LogInController extends GetxController {
  RxInt pageNum=0.obs;

  //Get.update;
  
  bool isSecure = true;
   
  late StatusRequest statusRequest;

  SettingServices settingServices=Get.find();

  LoginData loginData  = LoginData(Get.find()) ; 

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  



  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading; 
      update() ; 
      var response = await loginData.postdata(email.text , password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          settingServices.share.setInt("id", response['data']['users_id']);
          settingServices.share.setString("email", response['data']['email']);
          settingServices.share.setString("name", response['data']['name']);
          settingServices.share.setString("phone", response['data']['phone']);
          settingServices.share.setString("user_type", response['data']['user_type']);
          if(response['data']['user_type']=="student"){
           Get.to(const StudentNavigatorButton());
           }
          else if(response['data']['user_type']=="graduate"){
           Get.to(const GraduateNavigatorButton());}
           else if(response['data']['user_type']=="career_advisor"){
           Get.to(const CareerAdvisorNavigatorButton());}
        } else if (response['status'] == "failur"){
          Get.defaultDialog(title: "ُWarning" , middleText: "Email Or Password Not Correct"); 
          statusRequest = StatusRequest.failure;
        }else {
          Get.defaultDialog(title: "ُWarning" , middleText: "User is Blocked Please Call The Admin"); 
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      
    }
  }
  @override
  
  void showPassword() {
    isSecure = !isSecure;
    update();
  }
    void onInit() {
 
     password=TextEditingController();
     email=TextEditingController();
   
     
     super.onInit();
  }
   @override
  void dispose() {
   
    email.dispose();
   
    password.dispose();
   
    super.dispose();
  }
}