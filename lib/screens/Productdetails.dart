import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:marudhara/helper/DataProvider/CartService.dart';
import 'package:marudhara/helper/Themes.dart';

import 'Checkout/checkout.dart';

class ProductDetail extends StatefulWidget {
  final product_id;
  final cat_id;
  const ProductDetail({super.key, this.product_id, this.cat_id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int counter = 0;
  late Future<QuerySnapshot<Map<String, dynamic>>> _myproducts;
  late Future<QuerySnapshot<Map<String, dynamic>>> _mycategory;
  String category_name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myproducts = loadProducts();
    _mycategory = loadCategories(widget.cat_id);
    _mycategory.then((value) => category_name = value.docs[0].data()["name"]);
    setState(() {});
  }

  Future<QuerySnapshot<Map<String, dynamic>>> loadProducts() {
    var response = FirebaseFirestore.instance
        .collection("Products")
        .where("pid", isEqualTo: widget.product_id)
        .get();
    return response;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> loadCategories(String catid) {
    var response = FirebaseFirestore.instance
        .collection("Category")
        .where("id", isEqualTo: catid)
        .get();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int? price;
    String? name;
    String? image;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text("Product Detail"),
        titleTextStyle:
            myRegularFont.copyWith(fontSize: 18, color: Colors.black),
        elevation: 0,
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: _myproducts,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.data == null) {
              return const Text('Product not found');
            } else {
              final productData = snapshot.data!.docs;

              for (var doc in productData) {
                Map<String, dynamic> data = doc.data();
                name = data['name'];
                price = data['Price'];
                image = data['image'];
                // Access other fields as needed
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          height: size.height * .6,
                          fit: BoxFit.fill,
                          image!,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(category_name,
                          style: mySemiBold.copyWith(fontSize: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name.toString(),
                              style: myRegularFont.copyWith(
                                  fontSize: 14,
                                  color: const Color(0xff666666))),
                          Text("Rs.${price}",
                              style: mySemiBold.copyWith(
                                  color: primaryColor, fontSize: 14))
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                            color: const Color(0xff2222222),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: () {
                                    counter > 0
                                        ? setState(() {
                                            counter--;
                                          })
                                        : counter;
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 21,
                                  )),
                              Text(
                                ' ${counter} ',
                                style:
                                    myRegularFont.copyWith(color: Colors.white),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      counter++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 21,
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, bottom: 5),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        fixedSize: Size(size.width * .40, 50)),
                                    onPressed: () {
                                      if (counter == 0) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please add atleast one quantity");
                                      } else {
                                        CartService().addItemToCart({
                                          "pid": widget.product_id,
                                          "Price": price,
                                          "pname": name,
                                          "image": image,
                                          "quantity": counter,
                                          "category_name": category_name,
                                        });

                                        Get.to(() => const CheckOutScreen(),
                                            transition:
                                                Transition.rightToLeftWithFade);
                                      }
                                    },
                                    child: Text(
                                      "View cart",
                                      style: mySemiBold.copyWith(fontSize: 16),
                                    )),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 22,
                      )
                    ]),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
