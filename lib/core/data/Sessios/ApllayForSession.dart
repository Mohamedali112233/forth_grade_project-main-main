
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class ApllaySessions {
  Crud crud;
  ApllaySessions(this.crud);
  postData(dynamic seion_id,dynamic user_id,dynamic user_type) async {
    var response = await crud.postData(AppLink.ApllayforSession, {
      "seion_id":seion_id,
      "user_id":user_id,
      "user_type":user_type
    });
    return response.fold((l) => l, (r) => r);
  }
}