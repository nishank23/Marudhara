import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../helper/Themes.dart';
import '../../helper/widgets/myTextInput.dart';

class AddPurchaseDialog extends StatefulWidget {
  const AddPurchaseDialog({super.key});

  @override
  State<AddPurchaseDialog> createState() => _AddPurchaseDialogState();
}

class _AddPurchaseDialogState extends State<AddPurchaseDialog> {
  final partyname = TextEditingController();
  final workname = TextEditingController();
  final Bnname = TextEditingController();
  final pannaname = TextEditingController();
  final quality = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Purchaser",
          style: myRegularFont,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          myTextInput(
            hint_text: "Party Name",
            textcontroller: partyname,
          ),
          const SizedBox(
            height: 16,
          ),
          myTextInput(
            hint_text: "Work",
            textcontroller: workname,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: myTextInput(
                  hint_text: "B.N/C.N",
                  textcontroller: Bnname,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: myTextInput(
                  hint_text: "Panna",
                  textcontroller: pannaname,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          myTextInput(
            hint_text: "Quality",
            textcontroller: quality,
          ),
          const SizedBox(
            height: 16,
          ),
          myTextInput(
            hint_text: "Quality",
            textcontroller: quality,
          ),
        ]),
      ),
    );
  }
}
