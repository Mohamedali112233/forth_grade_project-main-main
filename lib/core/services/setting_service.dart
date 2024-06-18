import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingServices extends GetxService {
  late SharedPreferences share;
  Future<SettingServices> init() async {
    //put anything here that you need it to start your program
    share = await SharedPreferences.getInstance() ;
    return this;
  }
}