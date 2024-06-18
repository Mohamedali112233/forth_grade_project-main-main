
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class AcecptedUsersForSessios {
  Crud crud;
  AcecptedUsersForSessios(this.crud);
  postDat(dynamic requsted_tybe,dynamic user_type,dynamic user_id,dynamic session_id) async {
    var response = await crud.postData(AppLink.AcecptedUsersForSessios, {
      "requsted_tybe":requsted_tybe,
      "user_type":user_type,
      "user_id":user_id,
      "session_id":session_id,
     
    });
    return response.fold((l) => l, (r) => r);
  }
}