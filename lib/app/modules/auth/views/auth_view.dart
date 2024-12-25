import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:startup_sw_dev/app/routes/app_pages.dart';
import 'package:startup_sw_dev/app/utils/custom_toast.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  AuthView({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'noAccount'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                'register'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xFF2972FF),
                ),
              ).onTap(
                () {
                  // CPSignUpScreen().launch(context);
                },
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 80, bottom: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'login'.tr,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                          width: 60,
                          height: 3,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xFF2972FF),
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Color(0xFF2972FF),
                              //       blurRadius: 10,
                              //       spreadRadius: 2)
                              // ]
                              )),
                      SizedBox(width: 8),
                      Container(
                          width: 10,
                          height: 3,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Color(0xFF2972FF),
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Color(0xFF2972FF),
                              //       blurRadius: 10,
                              //       spreadRadius: 2)
                              // ]
                              )),
                    ],
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: authController.emailController,
                    obscureText: false,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    onSubmitted: (value) {
                      FocusScope.of(context)
                          .requestFocus(authController.passWordFocus);
                    },
                    focusNode: authController.emailFocus,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      filled: true,
                      isDense: false,
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 12, 8),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: authController.passController,
                    obscureText: true,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    focusNode: authController.passWordFocus,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      filled: true,
                      isDense: false,
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined,
                          color: Color(0xffa7a7a7), size: 22),
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(
                    () => CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        'remember'.tr,
                        style: TextStyle(fontStyle: FontStyle.normal),
                      ),
                      value: authController.checkBoxValue.value,
                      dense: true,
                      onChanged: (newValue) {
                        authController.checkBoxValue.value = newValue!;
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  SizedBox(height: 16),
                  MaterialButton(
                    onPressed: () {
                      // CPDashBoardScreen().launch(context);
                    },
                    color: Color(0xff2972ff),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    textColor: Color(0xffffffff),
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Text(
                      "OR",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff9d9d9d),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  MaterialButton(
                    onPressed: () async {
                      User? user = await authController.signInWithGoogle();
                      if (user != null) {
                        customToast(message: "Loading. . .");
                        Future.delayed(const Duration(seconds: 1), (() {
                          Get.offAllNamed(Routes.home);
                          customToast(message: "Welcome, ${user.displayName}!");
                        }));
                      } else {
                        customToast(message: "Google sign-in failed!");
                      }
                    },
                    color: context.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/svgs/google.svg",
                            height: 20,
                          ),
                        ),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal),
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
    );
  }
}
