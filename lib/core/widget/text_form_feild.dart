import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fourth_grade_project/core/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.numbersOnly = false,
      required this.label,
      required this.icon,
      required this.onChang,
      required this.isSecure, this.mycontroller, this.valid});
  final void Function(String) onChang;
    final TextEditingController? mycontroller;
    final String? Function(String?)? valid;
  final String hint;
  final String label;
  final Icon icon;
  final bool numbersOnly;
  final bool isSecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
       controller: mycontroller,
      validator: valid,
      obscureText: isSecure,
      onChanged: onChang,
      keyboardType: numbersOnly ? TextInputType.number : null,
      inputFormatters:
          numbersOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: kFloatingTextColor),
        // focusedLabelStyle: TextStyle(color: Colors.green),
        fillColor: kWhiteGray,
        prefixIcon: icon,
        hintText: hint,
        labelText: label,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
