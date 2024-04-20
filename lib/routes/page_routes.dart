import 'package:get/get.dart';
import 'package:jet/features/auth/views/check.dart';
import 'package:jet/features/auth/views/otp_page.dart';
import 'package:jet/features/auth/views/resetpassword.dart';
import 'package:jet/features/auth/views/siginup_page.dart';
import 'package:jet/features/auth/views/signin_page.dart';
import 'package:jet/features/auth/views/verifyemail.dart';
import 'package:jet/features/auth/views/welcome.dart';
import 'package:jet/features/home/views/home.dart';

var pages = [
  GetPage(
    name: "/welcome",
    page: () => const Welcome(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 800),
  ),
  GetPage(
    name: "/signin",
    page: () => const Signin(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 80),
  ),
  GetPage(
    name: "/signup",
    page: () => SignUp(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 80),
  ),
  GetPage(
    name: "/c",
    page: () => const Check(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 80),
  ),
  GetPage(
    name: "/otp",
    page: () => Otp(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/verifyemail",
    page: () => VerifyEmail(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/resetpassword",
    page: () => ResetPassword(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/home",
    page: () => const Home(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 80),
  ),
];
