import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helper/Themes.dart';
import '../Purchaser/AddPurchaser.dart';
import 'ChallanCatalog.dart';

class PurchaserCatalog extends StatefulWidget {
  const PurchaserCatalog({super.key});

  @override
  State<PurchaserCatalog> createState() => _PurchaserCatalogState();
}

class _PurchaserCatalogState extends State<PurchaserCatalog> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddPurchaseDialog(), fullscreenDialog: true);
          },
          child: const Icon(Icons.add)),
      backgroundColor: Colors.white,
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
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "B.N/C.N placefield",
                                    style: mySemiBold.copyWith(
                                        color: Colors.black),
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
                  ),
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
}
