import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/features/auth/auth_controllers/authentication_controller.dart';
import 'package:jet/models/user_model.dart';
import 'package:jet/widgets/toast.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool obscureText = true.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void loginUser() async {
    log(email.text);
    log(password.text);
    bool loggedIn = await AuthenticationController.instance
        .loginUserWithEmailAndPassword(email.text, password.text);
    if (loggedIn) {
      showToast(Get.context!, "Login Successful!");
    } else {
      showToast(Get.context!, "Login Failed!");
    }
  }

  googlesign() async {
    log("sign controller");
    UserCredential? userCredential =
        await AuthenticationController.instance.signInWithGoogle();
    if (userCredential != null && userCredential.user != null) {
      showToast(Get.context!, "Login Successful!");

      UserData user = UserData(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName,
        email: userCredential.user!.email,
        profile: userCredential.user!.photoURL,
      );

      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } else {
      showToast(Get.context!, "Login Failed!");

      log("User sign-in failed or user is null.");
    }
  }

  githubsign() async {
    log("sign controller");
    UserCredential? userCredential =
        await AuthenticationController.instance.signInWithGitHub();
    if (userCredential != null && userCredential.user != null) {
      UserData user = UserData(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName,
        email: userCredential.user!.email,
        profile: userCredential.user!.photoURL,
      );

      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } else {
      // Handle the case where sign-in failed
      log("User sign-in failed or user is null.");
    }
  }
}
