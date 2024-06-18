import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant.dart';
import '../../../core/widget/customScaffold.dart';
import '../../../core/widget/custom_data_view_box.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../../core/widget/custom_header_text.dart';

class StudentGraduateJobDetailsPage extends StatelessWidget {
  StudentGraduateJobDetailsPage(
      {super.key,
      required this.inFuture,
      required this.onTap,
      required this.jobTitle,
      required this.companyName,
      required this.jobType,
      required this.endIn,
      required this.endInHour,
      required this.jobRequirement,
      required this.jobDescription,
      required this.didAppliedForJob});
  final bool inFuture;
  final bool didAppliedForJob;
  final String jobTitle;
  final String companyName;
  final String jobType;
  final String jobRequirement;
  final String endIn;
  final String endInHour;
  final String jobDescription;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
        inNavigatorButton: false,
        widgetList: [
          SizedBox(
            height: screenHeight * .02,
          ),
          const CustomHeaderText(text: 'Jobs Details'),
          SizedBox(
            height: screenHeight * .01,
          ),
          CustomDataViewBox(
            content: jobTitle,
            label: 'Job title',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: jobType,
            label: 'Job Type',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: jobRequirement,
            label: 'Job requirement',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: companyName,
            label: 'Employer name',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: jobDescription,
            label: 'Job description ',
            function: () {},
            canModify: false,
          ),
          CustomDataViewBox(
            content: 'Deadline : $endIn  $endInHour',
            label: 'Job Applying Deadline ',
            function: () {},
            canModify: false,
          ),
          SizedBox(
            height: screenHeight * .02,
          ),
          inFuture
              ? didAppliedForJob
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth * .1, 0,
                          screenWidth * .1, screenHeight * .03),
                      child: CustomElevatedButton(
                        color: kMainColor,
                        textColor: Colors.black,
                        onTap: onTap,
                        hasText: true,
                        fontWeight: FontWeight.w400,
                        text: 'Cansel My Request',
                        minimanH: screenHeight * .06,
                        minimanW: screenWidth * .5,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth * .1, 0,
                          screenWidth * .1, screenHeight * .03),
                      child: CustomElevatedButton(
                        color: kMainColor,
                        textColor: Colors.black,
                        onTap: onTap,
                        hasText: true,
                        fontWeight: FontWeight.w400,
                        text: 'Apply For Job',
                        minimanH: screenHeight * .06,
                        minimanW: screenWidth * .5,
                      ),
                    )
              : SizedBox(
                  height: screenHeight * .04,
                ),
        ],
        imageName: kConfidencePerson);
  }
}
