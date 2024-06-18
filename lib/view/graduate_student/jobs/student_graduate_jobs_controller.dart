import 'package:flutter/material.dart';
import 'package:fourth_grade_project/core/class/statusrequest.dart';
import 'package:fourth_grade_project/core/data/jobs/jobs.dart';

import 'package:fourth_grade_project/core/functions/handingdatacontroller.dart';
import 'package:fourth_grade_project/model/job_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentGraduateJobsController extends GetxController {
 
  RxList<dynamic> jobs = <dynamic>[].obs;
  var isLoading = true.obs;
 getJobsData testData = getJobsData(Get.find());

  //List data = [];

  late StatusRequest statusRequest;
 DateTime now = DateTime.now();
 Future getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
         jobs.value = response['data'].map((json) => Job.fromJson(json)).toList();

       // jobs.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ; 
      }
    }
    print("............................................$jobs");
    update();
  }
String ddmmyyyy(DateTime dateTime) {
  

  // Format as dd/MM/yyyy
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  print('Formatted Date: $formattedDate'); // Output: Formatted Date: 13/06/2024 (example)

  return formattedDate;
}
String hhmm(DateTime dateTime) {
 

   String formattedTime = DateFormat('HH:mm').format(dateTime);
  print('Formatted Time: $formattedTime'); // Output: Formatted Time: 14:30 (example)

  return formattedTime;
}
  
  List<DropdownMenuItem<int>> dropdownMenuItems = [
    DropdownMenuItem(
      value:0,
      child: const Text('Random', style: TextStyle(color: Colors.black)),
      onTap: () {
        //todo: Apply the Date search function
      },
    ),
    DropdownMenuItem(
      value: 1,
      child: const Text('Date', style: TextStyle(color: Colors.black)),
      onTap: () {
     // sortByDeadline();
      },
    ),
    DropdownMenuItem(
      value: 2,
      child: const Text('Internship', style: TextStyle(color: Colors.black)),
      onTap: () {
        // todo: Apply the Internship search
      },
    ),
    DropdownMenuItem(
      value: 3,
      child: const Text('full-time job', style: TextStyle(color: Colors.black)),
      onTap: () {
        
      },
    ),
    DropdownMenuItem(
      value: 4,
      child: const Text('part-time job', style: TextStyle(color: Colors.black)),
      onTap: () {
        // todo: Apply the part-time job search
      },
    ),
    DropdownMenuItem(
      value: 5,
      child: const Text('Recommend', style: TextStyle(color: Colors.black)),
      onTap: () {
        // todo: Apply the Ai Recommend search
      },
    ),
  ];

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    await getData();
    // TODO: implement onInit
    super.onInit();
    // jobs.addAll([
    //   Job(
    //     inFuture: true,
    //     didAppliedForJob: true,
    //     jobTitle: 'Software Engineer',
    //     companyName: 'Tech Innovators Inc.',
    //     jobType: 'Full-time',
    //     jobRequirement:
    //         'Bachelor\'s degree in Computer Science or related field',
    //     endIn: '15/06/2024',
    //     endInHour: '3:00 PM',
    //     jobDescription: 'Develop and maintain software applications',
    //   ),
    //   Job(
    //     inFuture: true,
    //     didAppliedForJob: false,
    //     jobTitle: 'Data Analyst',
    //     companyName: 'HealthCare Solutions',
    //     jobType: 'Part-time',
    //     jobRequirement: 'Experience with data analysis tools',
    //     endIn: '10/07/2024',
    //     endInHour: '5:00 PM',
    //     jobDescription: 'Analyze data to provide insights',
    //   ),
    //   Job(
    //     inFuture: true,
    //     didAppliedForJob: true,
    //     jobTitle: 'Marketing Manager',
    //     companyName: 'Finance World',
    //     jobType: 'Full-time',
    //     jobRequirement: 'Marketing experience preferred',
    //     endIn: '20/07/2024',
    //     endInHour: '12:00 PM',
    //     jobDescription: 'Plan and execute marketing campaigns',
    //   ),
    //   Job(
    //     inFuture: false,
    //     didAppliedForJob: false,
    //     jobTitle: 'Graphic Designer',
    //     companyName: 'Eco Green',
    //     jobType: 'Contract',
    //     jobRequirement: 'Proficiency in Adobe Creative Suite',
    //     endIn: '25/04/2024',
    //     endInHour: '2:00 PM',
    //     jobDescription: 'Design graphics for various projects',
    //   ),
    //   Job(
    //     inFuture: true,
    //     didAppliedForJob: true,
    //     jobTitle: 'Project Manager',
    //     companyName: 'Innovatech',
    //     jobType: 'Full-time',
    //     jobRequirement: 'Project management certification',
    //     endIn: '30/08/2024',
    //     endInHour: '4:00 PM',
    //     jobDescription: 'Lead project teams to successful completion',
    //   ),
    // ]);
    isLoading.value = false;
  }
}

