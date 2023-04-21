import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../Themes.dart';

class LoginTextInput extends StatelessWidget {
  final textcontroller;
  final hint_text;
  final TextInputType keyboardtype;
  final ispassword;
  final icon;

  const LoginTextInput(
      {super.key,
      this.textcontroller,
      this.hint_text,
      required this.keyboardtype,
      this.ispassword,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        autofocus: false,
        autocorrect: false,
        obscureText: ispassword,
        style: myRegularFont.copyWith(color: Colors.black),
        controller: textcontroller,
        keyboardType: keyboardtype,
        decoration: InputDecoration(
            hintText: hint_text,
            filled: true,
            fillColor: greyColor,
            hintStyle: myRegularFont.copyWith(color: Colors.grey.shade300),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(
                icon,
              ),
            ),
            contentPadding: EdgeInsets.only(bottom: 22, left: 10),
            labelStyle: myRegularFont,
            helperStyle: myRegularFont,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300))),
      ),
    );
  }
}
