import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_app_ewa/data/models/players_model.dart';
import 'package:sport_app_ewa/services/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.text,
      required this.controller,
      this.keyboard,
      this.icon,
      this.prefixIcon,
      this.iconClose,
      this.fun});

  final String text;
  final TextEditingController controller;
  TextInputType? keyboard;
  IconData? prefixIcon;

  final Function(String)? fun;
  final Function()? iconClose;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
        onSubmitted: (value) {
          fun!(value);
        },
        keyboardType: keyboard,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: InkWell(
              onTap: () {
                iconClose!();
              },
              child: Icon(icon)),
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
