
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class ViewAttedneceAdvisingSessionsM {
  Crud crud;
  ViewAttedneceAdvisingSessionsM(this.crud);
  postDat(dynamic session_id) async {
    var response = await crud.postData(AppLink.ViewAttedneceAdvisingSessions, {
      "session_id":session_id,
     
    });
    return response.fold((l) => l, (r) => r);
  }
}