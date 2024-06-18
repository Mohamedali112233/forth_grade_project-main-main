
import 'dart:ffi';

import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class SignupStudentData {
  Crud crud;
  SignupStudentData(this.crud);
  postdata(String name ,String password ,String email ,String phone,String national_id ,dynamic selectedDate,String male,String GPA,String Grade) async {
    var response = await crud.postData(AppLink.signupstudent, {
      "name" : name,
      "password":password, 
      "email" :email,
      "phone" :phone,
      "national_id":national_id,
      "birthdate":selectedDate,
      "male":male,
      "GPA":GPA,
      "Grade":Grade

    });
    return response.fold((l) => l, (r) => r);
  }
}