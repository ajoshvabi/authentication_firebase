import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/widgets/toast.dart';

class VerifyEmailcontroller extends GetxController {
  static VerifyEmailcontroller get instance => Get.find();
  RxBool obscureText = true.obs;
  RxBool confirmobscureText = true.obs;
  RxBool verifypassword = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  next() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
        Get.snackbar(
            'Success', 'Check your email ${email.text} to reset password ',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color.fromARGB(106, 201, 201, 201),
            borderRadius: 10,
            margin: const EdgeInsets.all(15),
            snackStyle: SnackStyle.FLOATING,
            animationDuration: const Duration(milliseconds: 500),
            duration: const Duration(seconds: 4));
        await Future.delayed(const Duration(seconds: 5));
        Get.back();
      } else {
        if (user.email == email.text) {
          Get.toNamed(
            "/otp",
            arguments: {
              "email": email.text,
              "forgot": true,
            },
          );
        } else {
          Get.snackbar('Error',
              'The email entered does not match the email associated with your account',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: const Color.fromARGB(106, 201, 201, 201),
              borderRadius: 10,
              margin: const EdgeInsets.all(15),
              snackStyle: SnackStyle.FLOATING,
              animationDuration: const Duration(milliseconds: 500),
              duration: const Duration(seconds: 3));
        }
      }
    } catch (e) {
      // Handle the error
      // _status = AuthExceptionHandler.handleAuthException(e);
    }
  }

  checkpassword(value) {
    if (value == password.text) {
      log("true");
      verifypassword.value = true;
    } else {
      log("false");
      verifypassword.value = false;
    }
  }

  updatepassword() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await user?.updatePassword(confirmpassword.text);
      showToast(Get.context!, "Password Updated Successfully!");
    } catch (e) {
      if (kDebugMode) {
        print('Error updating password: $e');
      }
    }
  }

  // TextButton(
  //               onPressed: () {
  //                 Get.toNamed("/verifyemail");
  //               },
  //               child: Text(
  //                 "Forgot password?",
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: lightTheme.colorScheme.secondary,
  //                 ),
  //               ),
  //             ),

  //  AuthenticationController.instance.logout();
}
