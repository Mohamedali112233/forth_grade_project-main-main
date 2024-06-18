import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_elevated_button.dart';

import '../../../core/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/custom_header_text.dart';
import '../../../core/widget/text_form_feild.dart';
import 'create_session_controller.dart';

class CreateSessionPage extends StatelessWidget {
  const CreateSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    CreateSessionController controller = Get.put(CreateSessionController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(widgetList: [
      SizedBox(
        height: screenHeight * .025,
      ),
      const CustomHeaderText(text: 'Make A New Session'),
      SizedBox(height: screenHeight * .03),
      //title
      Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: CustomTextFormField(
            hint: "title",
            label: "Enter Session Title",
            icon: const Icon(Icons.tag),
            onChang: (value) {
              //TODO: add Name FUNCTION HERE
              // controller.name = value;
            },
            isSecure: false),
      ),
      Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: CustomTextFormField(
            hint: "Speaker Name",
            label: "Enter Speaker Name",
            icon: const Icon(Icons.person_outline_sharp),
            onChang: (value) {
              //TODO: add Speaker Name FUNCTION HERE
              // controller.name = value;
            },
            isSecure: false),
      ),
      Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: CustomTextFormField(
            hint: "Place",
            label: "Enter Session Place",
            icon: const Icon(Icons.location_on_outlined),
            onChang: (value) {
              //TODO: add Place FUNCTION HERE
              // controller.name = value;
            },
            isSecure: false),
      ),
      Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: CustomTextFormField(
            hint: "Notes",
            label: "Enter Session Notes",
            icon: const Icon(Icons.file_open_outlined),
            onChang: (value) {
              //TODO: add Notes FUNCTION HERE
              // controller.name = value;
            },
            isSecure: false),
      ),
      Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: CustomTextFormField(
            numbersOnly: true,
            hint: "Maximum Attendance",
            label: "Enter Maximum",
            icon: const Icon(Icons.one_x_mobiledata),
            onChang: (value) {
              //TODO: add Maximum Attendance number (int) FUNCTION HERE
              // controller.maximumAttendance = int.parse(value);
            },
            isSecure: false),
      ),
      //start and end time
      Padding(
        padding: EdgeInsets.all(screenWidth * .02),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await controller.pickStartDateTime(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: .7, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      10), // Optional: if you want sharp corners
                ),
                child: GetBuilder<CreateSessionController>(
                  builder: (controller) => ListTile(
                    leading: const Icon(Icons.date_range_outlined),
                    title: Text(controller.startDate == null
                        ? "Enter start date and time"
                        : controller.startDateTime()),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: screenWidth *
                    .038), // Add some space between the two fields
            GestureDetector(
              onTap: () async {
                await controller.pickEndDateTime(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: .7, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      10), // Optional: if you want sharp corners
                ),
                child: GetBuilder<CreateSessionController>(
                  builder: (controller) => ListTile(
                    leading: const Icon(Icons.date_range_outlined),
                    title: Text(controller.endDate == null
                        ? "Enter end date and time"
                        : controller.endDateTime()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(screenHeight * .02),
        child: CustomElevatedButton(
          color: kMainButton,
          textColor: kDarkGreen,
          onTap: () {
            //todo: here add the function the create session using all previse variables
            //todo : [title,name,place,notes,attendance, start,end]
          },
          minimanH: screenHeight * .06,
          minimanW: screenWidth * 09,
          hasText: true,
          text: 'Create Session',
          fontWeight: FontWeight.w600,
        ),
      ),
    ], imageName: kGirlFillSurvey);
  }
}
