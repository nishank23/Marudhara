import 'package:flutter/material.dart';

import '../Themes.dart';

class MyButton extends StatelessWidget {
  final btext;
  final VoidCallback mycallback;
   MyButton({Key? key, this.btext, required this.mycallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size  = MediaQuery.of(context).size;

    return ElevatedButton(
      
      
      onPressed: mycallback, child: Text(btext),style: ButtonStyle(
      fixedSize:MaterialStateProperty.all(Size(size.width * .80, 50)),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
      
        borderRadius: BorderRadius.all(Radius.circular(8)),
      )),
      textStyle: MaterialStateProperty.all(myRegularFont.copyWith(color: Colors.white))
    ),);
  }
}
