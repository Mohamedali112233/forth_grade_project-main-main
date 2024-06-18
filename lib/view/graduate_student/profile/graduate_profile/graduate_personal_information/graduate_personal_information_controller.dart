import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constant.dart';

class GraduatePersonalInformationController extends GetxController{
  //TODO: you should declared or assign the selectedDate with the birth in database
  DateTime? selectedDate;
  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.black, // Header background color
              onPrimary: Colors.white, // Header text color
              surface: kMainColor, // Background color of the date picker itself
              onSurface: Colors.black, // Text color of the date picker itself
            ),
            dialogBackgroundColor:
            Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      update();
      // print(selectedDate);
    }
  }

  String date() {
    if (selectedDate != null) {
      return DateFormat('dd/MM/yyyy').format(selectedDate!);
    } else {
      return 'Enter birth date';
    }
    update();
  }
  var text = 'Initial Value'.obs;

  void updateText(String newText) {
    text.value = newText;
  }
}