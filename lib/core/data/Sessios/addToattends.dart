
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class AddToattends {
  Crud crud;
  AddToattends(this.crud);
  postDat(dynamic attendance_tybe,dynamic user_type,dynamic user_id,dynamic session_id) async {
    var response = await crud.postData(AppLink.AcecptedUsersForSessios, {
      "attendance_tybe":attendance_tybe,
      "user_type":user_type,
      "user_id":user_id,
      "session_id":session_id,
     
    });
    return response.fold((l) => l, (r) => r);
  }
}