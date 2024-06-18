import 'package:get/get.dart';

class StudentGraduateSessionRecordController extends GetxController {
  //todo : get the data from database and add it into this list sessions after declared session model
  RxList<Session> sessions = <Session>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async{
    await Future.delayed(const Duration(seconds: 2)); // Simulate a network delay
    super.onInit();
    //todo: change this bart with fetching data
    // sessions.addAll([
    //   Session(
    //     isPassed: false,
    //     maximumAttendance: 30,
    //     companyName: 'Tech Innovators Inc.',
    //     sessionDetails: 'Introduction to AI and Machine Learning.',
    //     sessionType: 'Workshop',
    //     place: 'Conference Room A',
    //     speakerName: 'John Doe',
    //     endInHour: '3:00 PM',
    //     endIn: '15/06/2024',
    //     startInHour: '1:00 PM',
    //     startIn: '15/06/2024',
    //     title: 'AI and Machine Learning',
    //     enrolledOrNot: true,
    //   ),
    //   Session(
    //     isPassed: true,
    //     maximumAttendance: 50,
    //     companyName: 'HealthCare Solutions',
    //     sessionDetails: 'Advances in medical technology.',
    //     sessionType: 'Seminar',
    //     place: 'Auditorium B',
    //     speakerName: 'Jane Smith',
    //     endInHour: '5:00 PM',
    //     endIn: '10/05/2024',
    //     startInHour: '3:00 PM',
    //     startIn: '10/05/2024',
    //     title: 'Medical Technology Seminar',
    //     enrolledOrNot: false,
    //   ),
    //   Session(
    //     isPassed: false,
    //     maximumAttendance: 20,
    //     companyName: 'Finance World',
    //     sessionDetails: 'Basics of Stock Market Investments.',
    //     sessionType: 'Workshop',
    //     place: 'Room 101',
    //     speakerName: 'Michael Brown',
    //     endInHour: '12:00 PM',
    //     endIn: '20/07/2024',
    //     startInHour: '10:00 AM',
    //     startIn: '20/07/2024',
    //     title: 'Stock Market Basics',
    //     enrolledOrNot: true,
    //   ),
    //   Session(
    //     isPassed: true,
    //     maximumAttendance: 40,
    //     companyName: 'Eco Green',
    //     sessionDetails: 'Sustainable living practices.',
    //     sessionType: 'Lecture',
    //     place: 'Hall C',
    //     speakerName: 'Emily Davis',
    //     endInHour: '2:00 PM',
    //     endIn: '25/04/2024',
    //     startInHour: '12:00 PM',
    //     startIn: '25/04/2024',
    //     title: 'Sustainable Living',
    //     enrolledOrNot: false,
    //   ),
    //   Session(
    //     isPassed: false,
    //     maximumAttendance: 35,
    //     companyName: 'Innovatech',
    //     sessionDetails: 'Future of technology and innovation.',
    //     sessionType: 'Conference',
    //     place: 'Main Hall',
    //     speakerName: 'David Wilson',
    //     endInHour: '4:00 PM',
    //     endIn: '30/08/2024',
    //     startInHour: '2:00 PM',
    //     startIn: '30/08/2024',
    //     title: 'Future Tech Conference',
    //     enrolledOrNot: true,
    //   ),
    // ]);
    isLoading.value = false;
  }
  // Initialize sessions list
}
//todo : don't forget to change this
class Session {
  String sessionType;
  String speakerName;
  String title;
  String companyName;
  String startIn;
  String endIn;
  String startInHour;
  String endInHour;
  String sessionDetails;
  String place;
  int maximumAttendance;
  int applied;
  bool isPassed;
  bool enrolledOrNot;
  Session({
    required this.isPassed,
    required this.maximumAttendance,
    required this.companyName,
    required this.applied,
    required this.sessionDetails,
    required this.sessionType,
    required this.place,
    required this.speakerName,
    required this.endInHour,
    required this.endIn,
    required this.startInHour,
    required this.startIn,
    required this.title,
    required this.enrolledOrNot,
  });
}
