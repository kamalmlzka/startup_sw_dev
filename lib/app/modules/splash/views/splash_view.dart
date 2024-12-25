import 'package:startup_sw_dev/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_sw_dev/app/utils/custom_toast.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    _checkAuthentication();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/icons/icon-removebg-preview.png"),
          ),
          Text(
            'Time Master',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal),
          )
        ],
      )),
    );
  }

  void _checkAuthentication() async {
    await Future.delayed(const Duration(seconds: 2));
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offAllNamed(Routes.home); // Navigate to main screen if logged in
      customToast(message: "Welcome back, ${user.displayName}!");
    } else {
      Get.offAllNamed(Routes.auth); // Navigate to login screen if not logged in
    }
  }
}
