import 'package:get/get.dart';

import '../profile/sessions_record/sessions_record_controller.dart';

class StudentGraduateHomeController extends GetxController {
  Session? nextSession;
  Session? pastSession;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nextSession = Session(

        isPassed: false,
        applied: 20,
        maximumAttendance: 20,
        companyName: 'companyName',
        sessionDetails: 'sessionDetails',
        sessionType: 'sessionType',
        place: 'place',
        speakerName: 'speakerName',
        endInHour: 'endInHour',
        endIn: 'endIn',
        startInHour: 'startInHour',
        startIn: 'startIn',
        title: 'title',
        enrolledOrNot: true);
  }
}
