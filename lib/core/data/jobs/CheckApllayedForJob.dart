
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class CheckApllayedForJob {
  Crud crud;
  CheckApllayedForJob(this.crud);
  postData(dynamic job_id,dynamic user_id,dynamic user_type) async {
    var response = await crud.postData(AppLink.CheckApllayedForJob, {
      "job_id":job_id,
      "user_id":user_id,
      "user_type":user_type
    });
    return response.fold((l) => l, (r) => r);
  }
}