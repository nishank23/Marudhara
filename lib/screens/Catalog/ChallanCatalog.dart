import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helper/Themes.dart';
import '../Challan/AddChallan.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ChallanCatalog extends StatefulWidget {
  const ChallanCatalog({super.key});

  @override
  State<ChallanCatalog> createState() => _ChallanCatalogState();
}

class _ChallanCatalogState extends State<ChallanCatalog> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Get.to(() => const AddChallan(), fullscreenDialog: true);
          },
          child: const Icon(Icons.add)),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundColor: primaryColor,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Firoz",
                        style: myRegularFont.copyWith(fontSize: 16),
                      ),
                      const Spacer(),
                      PopupMenuButton<SampleItem>(
                        initialValue: selectedMenu,
                        // Callback that sets the selected popup menu item.
                        onSelected: (SampleItem item) {
                          setState(() {
                            selectedMenu = item;
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<SampleItem>>[
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemOne,
                            child: Text(
                              'Edit',
                              style: myRegularFont,
                            ),
                          ),
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemTwo,
                            child: Text(
                              'Delete',
                              style: myRegularFont,
                            ),
                          ),
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemThree,
                            child: Text(
                              'View',
                              style: myRegularFont,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors
                          .transparent, // if you want to remove the border
                    ),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.all(0),
                      backgroundColor: Colors.transparent,
                      title: Text(
                        "Details",
                        style: myMediumFont,
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 4, right: 4, top: 7, bottom: 7),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Icon(
                                  Icons.file_present_sharp,
                                  color: primaryColor,
                                )),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "B.N/C.N placefield",
                                  style:
                                      mySemiBold.copyWith(color: Colors.black),
                                ),
                                Text(
                                  "12 Jan 2023",
                                  style: myRegularFont.copyWith(
                                      color: Colors.grey.shade300,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/ic_cloth_quality.svg"),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Vichitra Blooming",
                                  style: mySemiBold,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Cloth quality",
                                  style: myRegularFont.copyWith(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/ic_catalog_icon.svg"),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Diamond",
                                  style: mySemiBold,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Job Work",
                                  style: myRegularFont.copyWith(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/ion_document-attach.svg"),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "120",
                                  style: mySemiBold,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Quantity",
                                  style: myRegularFont.copyWith(
                                    color: Colors.grey.shade300,
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors
                          .transparent, // if you want to remove the border
                    ),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.all(0),
                      backgroundColor: Colors.transparent,
                      title: Text(
                        "Work Details",
                        style: myMediumFont,
                      ),
                      children: [
                        ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text("2 Design * 30 pics", style: mySemiBold),
                                  Spacer(),
                                  Text("60 pics", style: mySemiBold)
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }

  showDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
