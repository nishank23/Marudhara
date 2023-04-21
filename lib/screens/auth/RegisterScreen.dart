import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../helper/Themes.dart';
import '../../helper/widgets/LoginTextInput.dart';
import '../../helper/widgets/myTextInput.dart';
import '../../helper/widgets/mybutton.dart';
import 'login/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(
                  height: size.height * .15,
                ),
                Center(
                  child: Text(
                    "LOGO",
                    style: myRegularFont.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    "Register",
                    style: myRegularFont.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
                  child: LoginTextInput(
                    hint_text: "Name",
                    textcontroller: namecontroller,
                    keyboardtype: TextInputType.name,
                    icon: "assets/icons/ic_name.svg",
                    ispassword: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
                  child: LoginTextInput(
                    hint_text: "Email",
                    textcontroller: emailcontroller,
                    keyboardtype: TextInputType.emailAddress,
                    icon: "assets/icons/ic_email.svg",
                    ispassword: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
                  child: LoginTextInput(
                    hint_text: "Password",
                    textcontroller: passwordcontroller,
                    keyboardtype: TextInputType.visiblePassword,
                    ispassword: true,
                    icon: "assets/icons/ic_password.svg",
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Spacer(),
                MyButton(
                  mycallback: () {
                    if (emailcontroller.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Email can't be empty");
                    } else if (passwordcontroller.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Password can't be empty");
                    } else if (namecontroller.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Name can't be empty");
                    } else {
                      registerWithEmailAndPassword(
                          emailcontroller.text, passwordcontroller.text);
                    }
                  },
                  btext: "Register",
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            )));
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Fluttertoast.showToast(msg: "User registered succesfully");
      Get.off(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      // Handle errors during registration
    }
  }
}
