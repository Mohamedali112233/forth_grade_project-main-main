import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/constant.dart';

class CreateSessionController extends GetxController {
  // todo: use there 2 variable to start and end the session
  DateTime? startDate;
  DateTime? endDate;

  Future<void> pickStartDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
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
            dialogBackgroundColor: Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(startDate ?? DateTime.now()),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.black, // Header background color
                onPrimary: Colors.white, // Header text color
                surface: kMainColor, // Background color of the time picker itself
                onSurface: Colors.black, // Text color of the time picker itself
              ),
              dialogBackgroundColor: Colors.white, // Background color of the dialog
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        final DateTime dateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        startDate = dateTime;
        update();
      }
    }
  }

  Future<void> pickEndDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
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
            dialogBackgroundColor: Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(endDate ?? DateTime.now()),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.black, // Header background color
                onPrimary: Colors.white, // Header text color
                surface: kMainColor, // Background color of the time picker itself
                onSurface: Colors.black, // Text color of the time picker itself
              ),
              dialogBackgroundColor: Colors.white, // Background color of the dialog
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        final DateTime dateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        endDate = dateTime;
        update();
      }
    }
  }

  String startDateTime() {
    if (startDate != null) {
      return DateFormat('dd/MM/yyyy HH:mm').format(startDate!);
    } else {
      return 'Enter start date and time';
    }
  }

  String endDateTime() {
    if (endDate != null) {
      return DateFormat('dd/MM/yyyy HH:mm').format(endDate!);
    } else {
      return 'Enter end date and time';
    }
  }
}
