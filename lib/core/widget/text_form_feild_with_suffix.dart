import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextFormFieldWithSuffix extends StatelessWidget {
  const CustomTextFormFieldWithSuffix(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      required this.suffixIcon,
      required this.onChang, required this.isSecure, this.mycontroller, this.valid});
  final void Function(String) onChang;
    final TextEditingController? mycontroller;
    final String? Function(String?)? valid;
  final String hint;
  final String label;
  final Icon icon;
  final Widget suffixIcon;
  final bool isSecure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: mycontroller,
      validator: valid,
      obscureText: isSecure,
      onChanged: onChang,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: kFloatingTextColor),
        prefixIcon: icon,
        hintText: hint,
        labelText: label,
        suffixIcon: suffixIcon,
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
