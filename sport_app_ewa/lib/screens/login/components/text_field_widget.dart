import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.text,
      required this.controller,
      this.keyboard,
      this.icon});
  final String text;
  final TextEditingController controller;
  TextInputType? keyboard;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyboard,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          contentPadding: const EdgeInsets.all(16),
          hintText: text,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff2a3c4e)),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff2a3c4e)),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff2a3c4e)),
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ));
  }
}
