import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/view/career_advisor/home/career_advisor_home_page.dart';
import 'package:fourth_grade_project/view/login/login_page.dart';
import 'package:get/get.dart';

import '../create_session/create_session_page.dart';
import '../profile/career_advisor_profile_page.dart';
import '../sessions/career_advisor_sessions_page.dart';

class CareerAdvisorNavigatorButton extends StatefulWidget {
  const CareerAdvisorNavigatorButton({super.key});

  @override
  State<CareerAdvisorNavigatorButton> createState() =>
      _CareerAdvisorNavigatorButton();
}

class _CareerAdvisorNavigatorButton
    extends State<CareerAdvisorNavigatorButton> {
  int page = 0;
  List<Widget> pages = [
    const CareerAdvisorHomePage(),
    const CareerAdvisorProfilePage(),
    const CareerAdvisorSessionsPage(),
    const CreateSessionPage(),
    const LogInPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      body: pages[page],
      bottomNavigationBar:
          page != 4 // Don't show BottomNavigationBar when on the LogInPage
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
                      icon: Icon(CupertinoIcons.plus_app),
                      activeIcon: Icon(CupertinoIcons.plus_app_fill),
                      label: 'New Session',
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
