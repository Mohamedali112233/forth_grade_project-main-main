
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(dynamic email ,dynamic password) async {
    var response = await crud.postData(AppLink.login, {
      "email" : email , 
      "password" : password   
    });
    return response.fold((l) => l, (r) => r);
  }
}