import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_grade_project/view/login/login_page.dart';
import 'package:fourth_grade_project/view/signup/student/student_signup_controller.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../../core/widget/customScaffold.dart';
import '../../../core/widget/custom_list_picker.dart';
import '../../../core/widget/text_form_feild.dart';
import '../../../core/widget/text_form_feild_with_suffix.dart';

class StudentSignUpPage extends StatelessWidget {
  const StudentSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    StudentSignUpController controller = Get.put(StudentSignUpController());
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Form(
      key: controller.formstate,
      child: CustomScaffold(
        inNavigatorButton: false,
        imageName: (kPersonalData),
        widgetList: [
          SizedBox(height: screenHeight * .05),
          //title
          Row(
            children: [
              SizedBox(width: screenWidth * .04),
              Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: screenWidth * .09,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: screenHeight * .03),
          //name
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: CustomTextFormField(mycontroller: controller.name,
                hint: "Name",
                label: "Enter Name",
                icon: const Icon(Icons.person_outline_outlined),
                onChang: (value) {
                  //TODO: add Name FUNCTION HERE
                  // controller.name = value;
                },
                isSecure: false),
          ),
          //email
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: CustomTextFormField(mycontroller: controller.email,
                hint: "Email",
                label: "Enter Email",
                icon: const Icon(Icons.email_outlined),
                onChang: (value) {
                  //TODO: add email FUNCTION HERE
                  //controller.email = value;
                },
                isSecure: false),
          ),
          //password
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: GetBuilder(
              init: controller,
              builder: (controller) => CustomTextFormFieldWithSuffix(
                mycontroller:controller.password,
                hint: "Password",
                label: "Enter Password",
                icon: const Icon(Icons.lock_outline),
                onChang: (value) {
                  //TODO: add PASSWORD FUNCTION HERE
                  // controller.password = value;
                },
                isSecure: controller.isSecure,
                suffixIcon: IconButton(
                    icon: controller.isSecure
                        ? const Icon(CupertinoIcons.eye_fill)
                        : const Icon(CupertinoIcons.eye),
                    onPressed: () {
                      controller.showPassword();
                    }),
              ),
            ),
          ),
          //age
          // Padding(
          //   padding: EdgeInsets.all(screenWidth * .02),
          //   child: CustomTextFormField(
          //       numbersOnly: true,
          //       hint: "Age",
          //       label: "Enter Age",
          //       icon: const Icon(Icons.person_outline_outlined),
          //       onChang: (value) {
          //        // controller.age = int.tryParse(value);
          //       },
          //       isSecure: false),
          // ),
          //phone
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: CustomTextFormField(
              mycontroller: controller.phone,
                numbersOnly: true,
                hint: "Phone",
                label: "Enter Phone number",
                icon: const Icon(Icons.phone_outlined),
                onChang: (value) {
                  //TODO: add phone FUNCTION HERE
                  //  controller.phone=int.tryParse(value);
                },
                isSecure: false),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: CustomTextFormField(mycontroller: controller.national_id,
                hint: "National_id",
                label: "Enter National_id",
                icon: const Icon(Icons.email_outlined),
                onChang: (value) {
                  //TODO: add email FUNCTION HERE
                  //controller.email = value;
                },
                isSecure: false),
          ),
          //grade
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: CustomTextFormField(mycontroller: controller.Grade,
                hint: "Grade",
                label: "Enter Grade",
                icon: const Icon(Icons.grade_outlined),
                onChang: (value) {
                  //TODO: add grade FUNCTION HERE
                  //controller.email = value;
                },
                isSecure: false),
          ),
          //GPA
          Padding(
            padding: EdgeInsets.all(screenWidth * .02),
            child: CustomTextFormField(
              mycontroller: controller.GPA,
                numbersOnly: true,
                hint: "GPA",
                label: "Enter GPA",
                icon: const Icon(Icons.credit_card_sharp),
                onChang: (value) {
                  //TODO: add GPA FUNCTION HERE
                  // controller.nationalId=int.tryParse(value);
                },
                isSecure: false),
          ),
          // Date of birth
          Padding(
            //todo: this do pick the date of birth and put the value in *selectedDate*
            padding: EdgeInsets.all(screenWidth * .02),
            child: GestureDetector(
              onTap: () async {
                await controller.pickDate(context);
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
                child: GetBuilder<StudentSignUpController>(
                  builder: (controller) => ListTile(
                    leading: const Icon(Icons.date_range_outlined),
                    title: Text(controller.selectedDate == null
                        ? "Enter Your birth data"
                        : controller.date()),
                  ),
                ),
              ),
            ),
          ),
          //gender
          GetBuilder(
            init: controller,
            builder: (controller) => CustomListPicker(
              hint: controller.gender ? "male" : "female",
              label: '',
              icon: controller.gender
                  ? const Icon(
                      Icons.male,
                      color: Colors.blueAccent,
                    )
                  : const Icon(
                      Icons.female,
                      color: Colors.pinkAccent,
                    ),
              onChanged: (value) {
                // todo: its the gender value  true = male ,false = female
                controller.gender = value;
              },
              value: controller.gender,
              items: [
                DropdownMenuItem(
                  onTap: () {
                    controller.isMale = true;
                    controller.update();
                  },
                  value: true,
                  child: const Text('male'),
                ),
                DropdownMenuItem(
                  value: false,
                  onTap: () {
                    controller.isMale = false;
                    controller.update();
                  },
                  child: const Text('female'),
                )
              ],
            ),
          ),
          // SizedBox(height: screenHeight * .03),
      
          SizedBox(height: screenHeight * .03),
          // Sgin Up button
           Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: CustomElevatedButton(
              hasText: true,
              text: 'Sign Up',
              color: kMainButton,
              textColor: Colors.white,
              onTap: () {
               controller.signUpStudent();
              },
              minimanW: screenWidth,
              minimanH: screenHeight * .07),
        ),
        SizedBox(height: screenHeight * .03),
      ],
    ));
  }
}