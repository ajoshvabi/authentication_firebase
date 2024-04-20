import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/animations/fade_in_slide.dart';
import 'package:jet/constants/asset_constants.dart';
import 'package:jet/constants/text_constants.dart';
import 'package:jet/features/auth/auth_controllers/sigin_controller.dart';
import 'package:jet/features/auth/auth_controllers/signup_controller.dart';
import 'package:jet/themes/app_theme.dart';

class SignUp extends StatelessWidget {
  final controller = Get.put(SignUpController());
  final signcontroller = Get.put(SignInController());

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: Get.theme.brightness == Brightness.light
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
                  ],
          ),
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
                        AssetConstants.getLogo(Get.theme.brightness),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeInSlide(
                      duration: .4,
                      child: ElevatedButton(
                        onPressed: () {
                          signcontroller.googlesign();
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(
                              color: Get.theme.colorScheme.primary,
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
                                      color: Get.theme.colorScheme.primary,
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
                      duration: .5,
                      child: ElevatedButton(
                        onPressed: () {
                          signcontroller.githubsign();
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(
                              color: Get.theme.colorScheme.primary,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetConstants.getGit(Get.theme.brightness),
                                height: 30,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    TextConstants.github,
                                    style: TextStyle(
                                      color: Get.theme.colorScheme.primary,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 15),
                      child: FadeInSlide(
                        duration: .6,
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
                                "OR SIGN UP WITH EMAIL",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FadeInSlide(
                        duration: .7,
                        child: TextField(
                          controller: controller.name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white10,
                            hintText: "Enter your Name",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primary),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FadeInSlide(
                        duration: .8,
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
                                  color: Get.theme.colorScheme.primary),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Obx(
                        () => FadeInSlide(
                          duration: .9,
                          child: TextField(
                            controller: controller.password,
                            obscureText: controller.obscureText.value,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white10,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.obscureText.toggle();
                                },
                                icon: Icon(controller.obscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              hintText: "Enter your Password",
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Get.theme.colorScheme.primary),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Obx(
                            () => FadeInSlide(
                              duration: 1,
                              child: TextField(
                                controller: controller.confirmpassword,
                                obscureText:
                                    controller.confirmobscureText.value,
                                onChanged: (value) {
                                  controller.checkpassword(value);
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white10,
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Obx(
                                        () => controller.verifypassword.value
                                            ? const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              )
                                            : const SizedBox(),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.confirmobscureText
                                              .toggle();
                                        },
                                        icon: Icon(
                                            controller.confirmobscureText.value
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                      ),
                                    ],
                                  ),
                                  hintText: "Confirm your Password",
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => FadeInSlide(
                        duration: 1.1,
                        child: ElevatedButton(
                          onPressed: controller.verifypassword.value
                              ? () {
                                  // Get.toNamed("/otp",
                                  //     arguments: {controller.email.text});
                                  Get.toNamed(
                                    "/otp",
                                    arguments: {
                                      "email": controller.email.text,
                                      "forgot": false,
                                    },
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightTheme.colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Spacer(),
                    Center(
                      child: FadeInSlide(
                        duration: 1.2,
                        direction: FadeSlideDirection.btt,
                        
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an account?',
                            children: [
                              TextSpan(
                                text: ' Sign in',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAndToNamed("/signin");
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
