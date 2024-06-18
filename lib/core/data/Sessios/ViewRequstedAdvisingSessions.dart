
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class ViewRequstedAdvisingSessions {
  Crud crud;
  ViewRequstedAdvisingSessions(this.crud);
  postDat(dynamic session_id) async {
    var response = await crud.postData(AppLink.ViewRequstedAdvisingSessions, {
      "session_id":session_id,
     
    });
    return response.fold((l) => l, (r) => r);
  }
}