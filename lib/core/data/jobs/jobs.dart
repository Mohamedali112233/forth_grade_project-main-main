
import 'package:fourth_grade_project/core/class/crud.dart';
import 'package:fourth_grade_project/linkeApi.dart';

class getJobsData {
  Crud crud;
  getJobsData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewjobs, {});
    return response.fold((l) => l, (r) => r);
  }

  getfullData() {}
}class getJobsDatafulltime {
  Crud crud;
  getJobsDatafulltime(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewfulljobs, {});
    return response.fold((l) => l, (r) => r);
  }
}