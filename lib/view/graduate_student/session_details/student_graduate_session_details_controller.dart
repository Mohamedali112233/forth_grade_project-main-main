import 'package:fourth_grade_project/core/services/setting_service.dart';
import 'package:get/get.dart';

class StudentGraduateSessionDetailsController extends GetxController {
  SettingServices share= Get.find();
  RxString content = ''.obs; // Initialize with an empty string

  void updateContent() {
    content.value = share.share.getString('newValue')!;
  }
}
