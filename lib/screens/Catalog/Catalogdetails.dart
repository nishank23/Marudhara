import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../helper/Themes.dart';
import 'ChallanCatalog.dart';
import 'PurchaserCatalog.dart';

class CatalogDetails extends StatefulWidget {
  const CatalogDetails({super.key});

  @override
  State<CatalogDetails> createState() => _CatalogDetailsState();
}

class _CatalogDetailsState extends State<CatalogDetails>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Catalog Details",
          style: myRegularFont.copyWith(color: Colors.black),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 12,
        ),
        Container(
          margin: const EdgeInsets.all(12),
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
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                      Text("12 Jan 2023",
                          style: myRegularFont.copyWith(
                              fontSize: 14, color: Colors.grey.shade400)),
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
              ],
            ),
          ),
        ),
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.red,
          labelStyle: myRegularFont,
          tabs: const [
            Tab(
              text: "Purchaser",
              icon: Icon(Icons.shopping_bag),
            ),
            Tab(
              text: "Challan",
              icon: Icon(
                Icons.badge,
              ),
            ),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        Expanded(
          child: TabBarView(
            children: [PurchaserCatalog(), ChallanCatalog()],
            controller: _tabController,
          ),
        ),
      ]),
    );
  }
}
