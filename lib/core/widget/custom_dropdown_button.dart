import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';



class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({
    super.key,
    required this.title,
    required this.fontSize,
    required this.items,
     this.selectedValue,
    required this.onTap,
  });
  String title;
  String? selectedValue;
  double fontSize;
  List<String> items;
  final void Function(String?) onTap; // Corrected the type to accept nullable String
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black,
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onTap,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
