import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/features/auth/auth_controllers/authentication_controller.dart';
import 'package:jet/models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final controller = Get.lazyPut(() => AuthenticationController());

  RxBool obscureText = true.obs;
  RxBool confirmobscureText = true.obs;
  RxBool verifypassword = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  checkpassword(value) {
    if (value == password.text) {
      log("true");
      verifypassword.value = true;
    } else {
      log("false");
      verifypassword.value = false;
    }
  }

  void registerUser() async {
    log("${email.text} ${password.text}");
    String? uid = await AuthenticationController.instance
        .createUserWithEmailAndPassword(email.text, password.text);

    if (uid != null) {
      try {
        UserData user = UserData(
          name: name.text,
          email: email.text,
          uid: uid,
        );
        await _firestore.collection('users').doc(uid).set(user.toJson());
        name.clear();
        email.clear();
        password.clear();
        confirmpassword.clear();
      } catch (error) {
        log("Error storing user data in Firestore: $error");
      }
    } else {
      log("User creation failed. Unable to store data in Firestore.");
    }
  }
}
