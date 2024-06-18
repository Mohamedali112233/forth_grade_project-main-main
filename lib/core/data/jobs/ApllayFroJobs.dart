
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class ApllayFroJobs {
  Crud crud;
  ApllayFroJobs(this.crud);
  postData(dynamic job_id,dynamic user_id,dynamic user_type,dynamic CvsUrl,dynamic ranke) async {
    var response = await crud.postData(AppLink.ApllayFroJobs, {
      "job_id":job_id,
      "user_id":user_id,
      "user_type":user_type,
      "CvsUrl":CvsUrl,
      "ranke":ranke

    });
    return response.fold((l) => l, (r) => r);
  }
}