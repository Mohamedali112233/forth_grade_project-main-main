import 'package:flutter/cupertino.dart';
import 'package:fourth_grade_project/core/widget/customScaffold.dart';
import 'package:fourth_grade_project/core/widget/custom_header_text.dart';

import '../../../core/constant.dart';

class GraduateSurvey extends StatelessWidget {
  const GraduateSurvey({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return CustomScaffold(
        inNavigatorButton: false,
        widgetList:  [
          SizedBox(height: screenHeight*.025,),
          const CustomHeaderText(text: 'Fill the Survey'),
        ],
        imageName: kGirlFillSurvey);
  }
}
