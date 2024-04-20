import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/animations/fade_in_slide.dart';
import 'package:jet/constants/asset_constants.dart';
import 'package:jet/constants/text_constants.dart';
import 'package:jet/features/auth/auth_controllers/sigin_controller.dart';
import 'package:jet/themes/app_theme.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: Theme.of(context).brightness == Brightness.light
                  ? [
                      const Color.fromARGB(255, 231, 231, 165).withOpacity(0.6),
                      const Color.fromARGB(255, 215, 215, 177).withOpacity(0.6),
                      const Color.fromARGB(255, 167, 218, 226).withOpacity(0.6),
                      const Color.fromARGB(255, 138, 215, 227).withOpacity(0.6),
                      const Color.fromARGB(255, 226, 202, 244).withOpacity(0.6),
                      const Color.fromARGB(255, 192, 157, 220).withOpacity(0.6),
                    ]
                  : [
                      const Color.fromARGB(255, 0, 0, 0),
                      const Color.fromARGB(255, 0, 0, 0)
                    ]),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.longestSide,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    FadeInSlide(
                      duration: .3,
                      child: Image.asset(
                        AssetConstants.getLogo(Theme.of(context).brightness),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeInSlide(
                      duration: .4,
                      child: Text(
                        TextConstants.signinwelcome,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeInSlide(
                      duration: .5,
                      child: ElevatedButton(
                        onPressed: () {
                          log("google signin");
                          controller.googlesign();
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetConstants.google,
                                height: 30,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    TextConstants.google,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInSlide(
                      duration: .6,
                      child: ElevatedButton(
                        onPressed: () {
                          log("google signin");
                          controller.githubsign();
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetConstants.getGit(
                                    Theme.of(context).brightness),
                                height: 30,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    TextConstants.github,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInSlide(
                      duration: .7,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "OR LOGIN WITH EMAIL",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.7)),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeInSlide(
                      duration: .8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white10,
                            hintText: "Enter your Email",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: lightTheme.colorScheme.secondary),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeInSlide(
                      duration: .9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Obx(
                              () => TextField(
                                controller: controller.password,
                                obscureText: controller.obscureText.value,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white10,
                                  suffixIcon: IconButton(
                                    // Observe changes here
                                    onPressed: () {
                                      controller.obscureText
                                          .toggle(); // Toggling the value
                                    },
                                    icon: Icon(controller.obscureText
                                            .value // Using the value here
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  hintText: "Enter your Password",
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            lightTheme.colorScheme.secondary),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed("/verifyemail");
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: lightTheme.colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeInSlide(
                      duration: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.loginUser();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightTheme.colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Spacer(),
                    FadeInSlide(
                      duration: 1.1,
                      direction: FadeSlideDirection.btt,
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Don\'t have an account?',
                            children: [
                              TextSpan(
                                text: ' Sign up',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAndToNamed("/signup");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
