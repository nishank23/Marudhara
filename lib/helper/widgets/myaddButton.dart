import 'package:flutter/material.dart';

import '../Themes.dart';

class MyAddButton extends StatelessWidget {
  final btext;
  final double bheight;

  final VoidCallback mycallback;
  MyAddButton(
      {Key? key, this.btext, required this.mycallback, required this.bheight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ElevatedButton.icon(
      onPressed: mycallback,
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(size.width * .80, bheight)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          )),
          textStyle: MaterialStateProperty.all(
              myRegularFont.copyWith(color: Colors.white))),
      icon: Icon(Icons.add),
      label: Text(
        btext,
        style: myRegularFont,
      ),
    );
  }
}
