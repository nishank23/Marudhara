import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:marudhara/helper/Themes.dart';

import 'Checkout/checkout.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text("Product Detail"),
        titleTextStyle:
            myRegularFont.copyWith(fontSize: 18, color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
                height: size.height * .6,
                fit: BoxFit.fill,
                "https://cdn.pixabay.com/photo/2018/01/12/10/19/fantasy-3077928__480.jpg"),
          ),
          const SizedBox(
            height: 16,
          ),
          Text("Jodhpur jutties", style: mySemiBold.copyWith(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Jutties",
                  style: myRegularFont.copyWith(
                      fontSize: 14, color: const Color(0xff666666))),
              Text("Rs.500",
                  style: mySemiBold.copyWith(color: primaryColor, fontSize: 14))
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
                    style: myRegularFont.copyWith(color: Colors.white),
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
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            fixedSize: Size(size.width * .40, 50)),
                        onPressed: () {
                          Get.to(() => const CheckOutScreen(),
                              transition: Transition.rightToLeftWithFade);
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
      ),
    );
  }
}
