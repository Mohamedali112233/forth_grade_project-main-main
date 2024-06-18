import 'package:fourth_grade_project/core/constant.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_data_view_box.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'career_advisor_personal_information_controller.dart';


class CareerAdvisorPersonalInformationPage extends StatelessWidget {
  const CareerAdvisorPersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    CareerAdvisorPersonalInformationController controller =
    Get.put(CareerAdvisorPersonalInformationController());
    return CustomScaffold(
        inNavigatorButton: false,
        widgetList: [
          SizedBox(
            height: screenHeight * .02,
          ),
          const CustomHeaderText(text: 'My Personal Data'),
          SizedBox(
            height: screenHeight * .02,
          ),
          CustomDataViewBox(
            //todo:here put user name
            content: 'Joseph Adel Adip ',
            label: 'Full Name',
            function: () {
              //todo: here the function the will change the Full Name after it rebuild (refetch) the screen
            },
            canModify: true,
          ),
          CustomDataViewBox(
            //todo:here put email
            content: 'Josephadel@gmail.com',
            label: 'Email',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            //todo:here put phone
            content: '01010110071',
            label: 'Phone Number',
            function: () {
              //todo : function thatPhone Number
            },
            canModify: true,
          ),
          CustomDataViewBox(
            //todo: here Job title
            content: 'Senior Android Developer',
            label: 'Job title',
            function: () {
              //todo : function thatPhone Number
            },
            canModify: true,
          ),
          CustomDataViewBox(
            //todo:here Certificate
            content: 'Google Data Analytics Professional',
            label: 'Certificate',
            function: () {
              //function that change ID
              //todo : function change Certificate
            },
            canModify: true,
          ),
          CustomDataViewBox(
            //todo:here Skills
            content: 'Data Analytics',
            label: 'Skills',
            function: () {
              //function that change ID
              //todo : function change Skills
            },
            canModify: true,
          ),
          CustomDataViewBox(
            //todo:here put ID
            content: '3030107148954568',
            label: 'ID',
            function: () {
              //function that change ID
              //todo : function change ID
            },
            canModify: true,
          ),
          CustomDataViewBox(
            content: 'male',
            label: 'Gender',
            function: () {},
            canModify: false,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(screenWidth * .02, 0, 0, 0),
            child: Text(
              'Birth Date',
              style: TextStyle(
                fontSize: screenWidth * .04,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // date of birth
          Padding(
            //todo: this do pick the date of birth and put the value in *selectedDate*
            padding: EdgeInsets.all(screenWidth * .02),
            child: GestureDetector(
              onTap: () async {
                await controller.pickDate(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: .7, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      10), // Optional: if you want sharp corners
                ),
                child: GetBuilder<CareerAdvisorPersonalInformationController>(
                  builder: (controller) => ListTile(
                    //leading: const Icon(Icons.date_range_outlined),
                    title: Text(
                      controller.date(),
                      style: TextStyle(
                        fontSize: screenWidth * .045,
                        color: Colors.grey,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * .02,
          ),
        ],
        imageName: kPersonalData);
  }
}
