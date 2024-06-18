import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/view/graduate_student/home/student_graduate_home_page.dart';
import 'package:fourth_grade_project/view/graduate_student/profile/student_profile/student_profile_page.dart';
import 'package:fourth_grade_project/view/login/login_page.dart';
import 'package:get/get.dart';

import '../jobs/student_graduate_jobs_page.dart';
import '../profile/graduate_profile/graduate_profile_page.dart';
import '../session/student_graduate_sessions_page.dart';

class GraduateNavigatorButton extends StatefulWidget {
  const GraduateNavigatorButton({super.key});

  @override
  State<GraduateNavigatorButton> createState() => _GraduateNavigatorButtonState();
}

class _GraduateNavigatorButtonState extends State<GraduateNavigatorButton> {
  int page = 0;
  List<Widget> pages = [
    const StudentGraduateHomePage(),
    const GraduateProfilePage(),
    const StudentGraduateSessionsPage(),
    const StudentGraduateJobsPage(),
    const LogInPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: page != 4 // Don't show BottomNavigationBar when on the LogInPage
          ? BottomNavigationBar(
        onTap: (value) {
          if (value == 4) {
            Get.offAll(const LogInPage());
          } else {
            setState(() {
              page = value;
            });
          }
        },
        enableFeedback: true,
        showUnselectedLabels: true,
        currentIndex: page,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            activeIcon: Icon(CupertinoIcons.person_circle_fill),
            label: 'Profile',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            activeIcon: Icon(CupertinoIcons.book_fill),
            label: 'Sessions',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.number_circle),
            activeIcon: Icon(CupertinoIcons.number_circle_fill),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Get.offAll(const LogInPage());
              },
              child: Icon(
                Icons.logout,
                size: screenHeight * .028,
              ),
            ),
            label: 'Log Out',
          ),
        ],
      )
          : null,
    );
  }
}
