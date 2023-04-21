import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Themes.dart';

class myTextInput extends StatelessWidget {
  final textcontroller;
  final hint_text;

  const myTextInput({Key? key, this.textcontroller, this.hint_text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint_text,
          style: myRegularFont.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 45,
          child: TextField(
            autofocus: false,
            style: myRegularFont,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 22, left: 10),
                labelStyle: myRegularFont,
                helperStyle: myRegularFont,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.black))),
            controller: textcontroller,
          ),
        )
      ],
    );
  }
}
