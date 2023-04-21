import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../helper/Themes.dart';
import '../../helper/widgets/myTextInput.dart';
import '../../helper/widgets/myaddButton.dart';
import '../../helper/widgets/mybutton.dart';
import 'Catalogdetails.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  TextEditingController categorycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Catalog",
          style: myRegularFont.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Center(
            child: MyAddButton(
              bheight: 50,
              mycallback: () {
                myDialog(context);
              },
              btext: "Add",
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => CatalogDetails());
                  },
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: Colors.grey.shade200,
                              height: 80,
                              width: 80,
                              child: const Center(
                                  child: Text(
                                "IMG",
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Catalog name",
                                  style: myRegularFont.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text("12 Jan 2023",
                                    style: myRegularFont.copyWith(
                                        fontSize: 14,
                                        color: Colors.grey.shade400)),
                                const Spacer(),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Purchase ',
                                        style: myRegularFont.copyWith(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                      TextSpan(
                                        text: ': 02',
                                        style: myRegularFont.copyWith(
                                            color: primaryColor, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Challan ',
                                        style: myRegularFont.copyWith(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                      TextSpan(
                                        text: ': 02',
                                        style: myRegularFont.copyWith(
                                            color: primaryColor, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            margin: const EdgeInsets.only(
                                left: 0, right: 0, top: 15, bottom: 15),
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.navigate_next_rounded,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 15,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  myDialog(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: height * 0.5,
            child: Column(children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "Add Cateogry Details",
                style: myRegularFont.copyWith(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30),
                child: MyAddButton(
                  bheight: 45,
                  btext: "Add photo",
                  mycallback: () {},
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: myTextInput(
                  hint_text: "Category Name",
                  textcontroller: categorycontroller,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: MyButton(
                  btext: "Submit",
                  mycallback: () {
                    if (categorycontroller.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Category name can't be empty");
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 16,
              )
            ]),
          ),
        );
      },
    );
  }
}
