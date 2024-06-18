import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      this.minimanW,
      this.minimanH,
      this.text,
      this.hasText = false,
      required this.color,
      required this.textColor,
      required this.onTap,
      this.fontWeight = FontWeight.w500});
  final minimanW;
  final minimanH;
  String? text;
  bool hasText;
  final Color color;
  final FontWeight fontWeight;
  final Color textColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(minimanW, minimanH)),
          backgroundColor: MaterialStateColor.resolveWith((states) => color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          hasText ? text! : "Log In",
          style:
              TextStyle(fontSize: 20, color: textColor, fontWeight: fontWeight),
        ));
  }
}
