import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:marudhara/helper/DataProvider/CartService.dart';
import 'package:marudhara/screens/OrderSuccess/OrderSuccess.dart';

import '../../helper/Themes.dart';
import '../auth/RegisterScreen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  // Stream<List<Map<String, dynamic>>> getCartItems() {
  //   if (currentUser == null) {
  //     return Stream.value([]);
  //   }

  //   final cartRef =
  //       FirebaseFirestore.instance.collection('carts').doc(currentUser.uid);

  //   return cartRef.snapshots().map((snapshot) {
  //     final List<dynamic> items = snapshot.data()?['items'] ?? [];
  //     return items.cast<Map<String, dynamic>>().toList();
  //   });
  // }

  updateCartQuantity(int productid, int quantity) {}
  num mytotal = 0;

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    List<Map<String, dynamic>> mycartlist = [];
    num total = 0;
    var size = MediaQuery.of(context).size;
    var counter = 1;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text("Checkout"),
        titleTextStyle:
            myRegularFont.copyWith(fontSize: 18, color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: CartService().getCartItemsStream(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              }
              List<Map<String, dynamic>> cartItems = snapshot.data!;
              double total = 0.0;
              for (var i = 0; i < cartItems.length; i++) {
                total += cartItems[i]['Price'] * cartItems[i]['quantity'];
              }

              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    "My Cart",
                    style: myRegularFont,
                  ),

                  ListView.separated(
                    itemCount:
                        snapshot.data != null ? snapshot.data!.length : 0,
                    shrinkWrap: true,
                    primary: false,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                  snapshot.data![index]['image'].toString()),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index]['category_name']
                                        .toString(),
                                    style: mySemiBold.copyWith(fontSize: 20),
                                  ),
                                  Text(
                                    snapshot.data![index]['pname'].toString(),
                                    style: myRegularFont.copyWith(fontSize: 14),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      snapshot.data == null
                                          ? Text("Please wait")
                                          : RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "${snapshot.data![index]['Price']}",
                                                    style: mySemiBold.copyWith(
                                                        color: primaryColor,
                                                        fontSize: 14),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' x ${snapshot.data![index]['quantity']} = ${snapshot.data![index]['quantity'] * snapshot.data![index]['Price']}',
                                                    style: mySemiBold.copyWith(
                                                        color: const Color(
                                                            0xff666666),
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffF5F5F5),
                                        ),
                                        child: Row(children: [
                                          InkWell(
                                              onTap: () {
                                                int quantity = snapshot
                                                    .data![index]['quantity'];
                                                setState(() {});

                                                quantity--;

                                                CartService()
                                                    .updateCartItemQuantity(
                                                        snapshot.data![index]
                                                            ['id'],
                                                        quantity);
                                              },
                                              child: const Icon(
                                                Icons.remove_circle_outline,
                                                color: Colors.black,
                                                size: 21,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            ' ${snapshot.data![index]['quantity']} ',
                                            style: myRegularFont.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                int quantity = snapshot
                                                    .data![index]['quantity'];
                                                setState(() {});
                                                quantity++;
                                                CartService()
                                                    .updateCartItemQuantity(
                                                        snapshot.data![index]
                                                            ['id'],
                                                        quantity);
                                              },
                                              child: const Icon(
                                                Icons.add_circle_rounded,
                                                color: Colors.black,
                                                size: 21,
                                              )),
                                        ]),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                  ),
                  const Divider(color: Colors.black),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("Delivery Address",
                      style: myRegularFont.copyWith(fontSize: 14)),
                  const SizedBox(
                    height: 12,
                  ),
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(double.maxFinite, 45)),
                      onPressed: () {},
                      icon: const Icon(Icons.add_outlined),
                      label: Text("Add Address",
                          style: myRegularFont.copyWith(fontSize: 14))),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Payment Method",
                      style: myRegularFont.copyWith(fontSize: 14)),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: const Center(child: Text("IMG")),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Cash On Delivery",
                        style: myRegularFont.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Spacer(),
                  Text(
                    "Order Info",
                    style: myMediumFont.copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal",
                          style: myRegularFont.copyWith(
                              color: const Color(0xff666666), fontSize: 14)),
                      Text("Rs ${total.toString()}",
                          style: myRegularFont.copyWith(
                              color: const Color(0xff666666), fontSize: 14)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping Cost",
                          style: myRegularFont.copyWith(
                              color: const Color(0xff666666), fontSize: 14)),
                      Text("Rs 100",
                          style: myRegularFont.copyWith(
                              color: const Color(0xff666666), fontSize: 14)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Color(0xffD9D9D9),
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: myRegularFont.copyWith(
                              color: const Color(0xff666666), fontSize: 14)),
                      Text("Rs ${total + 100}",
                          style: myRegularFont.copyWith(
                              color: const Color(0xff666666), fontSize: 14)),
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: const Color(0xff2222222),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Price",
                                style: mySemiBold.copyWith(
                                    color: const Color(0xff747474),
                                    fontSize: 12),
                              ),
                              Text(
                                "Rs. ${total + 100}",
                                style: mySemiBold.copyWith(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    fixedSize: Size(size.width * .40, 50)),
                                onPressed: () {
                                  Get.off(() => const OrderSuccess(),
                                      transition: Transition.fade);
                                },
                                child: Text(
                                  "Confirm",
                                  style: mySemiBold.copyWith(fontSize: 16),
                                )),
                          )
                        ]),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
