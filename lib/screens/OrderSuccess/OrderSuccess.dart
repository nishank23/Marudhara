import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marudhara/helper/Themes.dart';
import 'package:marudhara/screens/home/home.dart';

import '../auth/login/LoginScreen.dart';

class OrderSuccess extends StatefulWidget {
  const OrderSuccess({super.key});

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.offAll(() => const homeScreen(),
          transition: Transition.rightToLeftWithFade);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icons/icon-park-solid_success.png",
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Order Success",
            style: mySemiBold.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Your  order has been placed successfully \n For more detail check your profile.",
            style: myRegularFont.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 50),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Get.offAll(() => const homeScreen(),
                      transition: Transition.rightToLeftWithFade);
                },
                child: Text(
                  "Continue Shopping",
                  style: mySemiBold.copyWith(fontSize: 16, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
