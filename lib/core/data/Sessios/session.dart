
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class GetSessionsData {
  Crud crud;
  GetSessionsData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewAllSession, {});
    return response.fold((l) => l, (r) => r);
  }
}