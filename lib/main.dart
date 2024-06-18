import 'package:flutter/material.dart';
import 'package:fourth_grade_project/binding/initalbinding.dart';
import 'package:fourth_grade_project/view/graduate_student/student_navigator/student_navigator.dart';
import 'package:fourth_grade_project/view/login/login_page.dart';
import 'package:get/get.dart';

import 'core/constant.dart';
import 'core/services/setting_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

Future<SettingServices> initialServices() async {
  return await Get.putAsync(() => SettingServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // LogInPageController controller = Get.put(LogInPageController());
    SettingServices share = Get.find();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //cardColor:kMainColor ,
        primaryColor: kMainColor,
        buttonTheme: ButtonThemeData(buttonColor: kMainButton),
        //buttonTheme: ButtonThemeData(buttonColor: kMainButton),
        //colorScheme: ColorScheme.fromSeed(seedColor: kMainColor),
        useMaterial3: true,
      ),
      //home: LogInPage(),
      initialRoute:'/',
      getPages: [GetPage(name: '/', page: ()=>LogInPage() )],
      initialBinding:InitialBindings() ,
    );
  }
}
