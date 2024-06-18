
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class ViewAdvisorAtSession {
  Crud crud;
  ViewAdvisorAtSession(this.crud);
  postData(dynamic career_advisor_id) async {
    var response = await crud.postData(AppLink.ViewAdvisorSessions, {
      "career_advisor_id":career_advisor_id,
     
    });
    return response.fold((l) => l, (r) => r);
  }
}