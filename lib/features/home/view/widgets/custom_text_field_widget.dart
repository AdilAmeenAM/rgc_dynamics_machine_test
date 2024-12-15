import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType? keybordType;

  const CustomTextFieldWidget(
      {super.key,
      required this.labelText,
      required this.controller,
      this.keybordType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        keyboardType: keybordType,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade800)),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
