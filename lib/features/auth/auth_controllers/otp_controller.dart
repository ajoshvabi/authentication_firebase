import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/features/auth/auth_controllers/signup_controller.dart';
import 'package:jet/widgets/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  final signupcontroller = Get.put(SignUpController());
  // final String email = Get.arguments.first;
  final String email = Get.arguments['email'] as String;
  final bool forgot = Get.arguments['forgot'] as bool;

  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  RxInt secondsRemaining = 0.obs;
  Timer? _timer;
  var otp = "";

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    one.clear();
    two.clear();
    three.clear();
    four.clear();
    generateOTP();
    secondsRemaining.value = 60;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        secondsRemaining--;
        if (secondsRemaining < 1) {
          otp = "";
          timer.cancel();
        }
      },
    );
  }

  generateOTP() {
    const int otpLength = 4;
    const String chars = '0123456789';
    var random = Random();
    for (int i = 0; i < otpLength; i++) {
      otp += chars[random.nextInt(chars.length)];
    }

    _sendEmail();
  }

  _sendEmail() async {
    String username = 'addressbuk123@gmail.com';
    String password = 'rkpv oytu dowd ikzn';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add(email)
      ..subject = 'OTP verification for Address buk'
      ..html =
          '<p>jet Use the following OTP to complete the registration process. OTP is valid for 1 minute. Do not share this code with others.</p><br><br><h1 style="text-align: center; color: blue;"><span style="font-weight: bold;">$otp</span></h1><br><br>';
    try {
      await send(message, smtpServer);
      showToast(Get.context!, "OTP sent successfully!");
    } catch (e) {
      print("error $e");
    }
  }

  verifyotp() {
    var userotp = one.text + two.text + three.text + four.text;
    if (otp == userotp) {
      if (forgot) {
        Get.offAndToNamed(
          "/resetpassword",
        );
      } else {
        signupcontroller.registerUser();
      }
    } else {
      one.clear();
      two.clear();
      three.clear();
      four.clear();
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    one.clear();
    two.clear();
    three.clear();
    four.clear();
    otp = "";
    super.onClose();
  }
}
