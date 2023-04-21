import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../helper/Themes.dart';

class AddChallan extends StatefulWidget {
  const AddChallan({super.key});

  @override
  State<AddChallan> createState() => _AddChallanState();
}

class _AddChallanState extends State<AddChallan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Add Challan",
            style: myRegularFont,
          )),
      body: Column(
        children: [],
      ),
    );
  }
}
