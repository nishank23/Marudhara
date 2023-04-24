import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../helper/Themes.dart';
import '../../../helper/widgets/LoginTextInput.dart';
import '../../../helper/widgets/myTextInput.dart';
import '../../../helper/widgets/mybutton.dart';
import '../../home/home.dart';
import '../RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                    "Login",
                    style: myRegularFont.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LoginTextInput(
                    icon: "assets/icons/ic_email.svg",
                    ispassword: false,
                    hint_text: "Email",
                    textcontroller: emailcontroller,
                    keyboardtype: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: LoginTextInput(
                    icon: "assets/icons/ic_password.svg",
                    ispassword: true,
                    hint_text: "Password",
                    textcontroller: passwordcontroller,
                    keyboardtype: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Dont have an account? ',
                        style: myRegularFont.copyWith(
                            color: const Color(0xffA1A1A1).withOpacity(.7),
                            fontSize: 14),
                      ),
                      TextSpan(
                          text: 'Sign up',
                          style: myRegularFont.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => const RegisterScreen());
                            }),
                    ],
                  ),
                ),
                const Spacer(),
                MyButton(
                  mycallback: () {
                    if (emailcontroller.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Email can't be empty");
                    } else if (passwordcontroller.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Password can't be empty");
                    } else {
                      signInWithEmailAndPassword(
                          emailcontroller.text, passwordcontroller.text);
                    }
                  },
                  btext: "Login",
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            )));
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      updateUserData(userCredential.user!.uid, email);

      Fluttertoast.showToast(msg: "User Login succesfully");

      Get.off(() => const homeScreen());

      // User login successful
    } on FirebaseAuthException catch (e) {
      // Handle errors during login
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }
}

Future<void> updateUserData(String userId, String email) async {
  FirebaseDatabase database = FirebaseDatabase.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final fcmToken = await FirebaseMessaging.instance.getToken();

  database.ref().child("users").child(userId).update({
    "email": email,
    "fcmtoken": fcmToken,
    "logged_id": DateTime.now().toString()
  });
}
