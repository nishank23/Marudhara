import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../helper/Themes.dart';
import '../Productdetails.dart';

class CategoriesDetail extends StatefulWidget {
  final cat_id;
  const CategoriesDetail({super.key, this.cat_id});

  @override
  State<CategoriesDetail> createState() => _CategoriesDetailState();
}

class _CategoriesDetailState extends State<CategoriesDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Text(
            "New Collection 💛",
            style: mySemiBold.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Products")
                      .where("cid", isEqualTo: widget.cat_id.toString())
                      .orderBy("cid", descending: false)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: size.width / size.height / .60),
                        shrinkWrap: true,
                        itemCount: streamSnapshot.data != null
                            ? streamSnapshot.data!.docs.length
                            : 0,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => ProductDetail(
                                        product_id: streamSnapshot
                                            .data!.docs[index]['pid'],
                                        cat_id: streamSnapshot.data!.docs[index]
                                            ['cid'],
                                      ),
                                  transition: Transition.downToUp);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                margin: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                          height: size.height * .18,
                                          fit: BoxFit.fill,
                                          streamSnapshot
                                              .data!.docs[index]['image']
                                              .toString()),
                                    ),
                                    const Spacer(),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        streamSnapshot.data!.docs[index]['name']
                                            .toString(),
                                        style: myRegularFont.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Rs.${streamSnapshot.data!.docs[index]['Price'].toString()}",
                                          style: myMediumFont.copyWith(
                                            color: primaryColor,
                                          ),
                                        ))
                                  ]),
                                ),
                              ),
                            ),
                          );
                        });
                  })),
        ],
      ),
    );
  }
}
