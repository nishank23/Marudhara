import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marudhara/helper/Constants.dart';

import '../helper/Themes.dart';

import 'auth/login/LoginScreen.dart';
import 'home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = FirebaseAuth.instance.currentUser != null
        ? true
        : false; // check user logged in or not

    isLoggedIn
        ? Timer(const Duration(seconds: 2), () {
            Get.offAll(() => const homeScreen());
          })
        : Timer(const Duration(seconds: 2), () {
            Get.offAll(() => const LoginScreen());
          });

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        Constants.app_name,
        style: myMediumFont.copyWith(fontSize: 34),
      )),
    );
  }
}
