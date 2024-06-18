import 'package:flutter/material.dart';

class CustomListPicker extends StatelessWidget {
  const CustomListPicker({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    required this.onChanged,
    required this.value,
    required this.items,
  });

  final void Function(dynamic)? onChanged;
  final String hint;
  final String label;
  final Icon icon;
  final dynamic value;
  final List<DropdownMenuItem<dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: DropdownButtonFormField(
        value: value,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hint,
          labelText: label,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
