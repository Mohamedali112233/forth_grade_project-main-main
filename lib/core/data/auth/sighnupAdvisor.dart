
import 'dart:ffi';

import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class SignupAdvisorData {
  Crud crud;
  SignupAdvisorData(this.crud);
  postdata(String name ,String password ,String email ,String phone,String national_id ,dynamic selectedDate,String male,String job_title,String skills,String certificate) async {
    var response = await crud.postData(AppLink.sighnupAdvisor, {
      "name" : name,
      "password":password, 
      "email" :email,
      "phone" :phone,
      "national_id":national_id,
      "birthdate":selectedDate,
      "male":male,
      "job_title":job_title,
      "certificate":certificate,
      "skills":skills,
    });
    return response.fold((l) => l, (r) => r);
  }
}