import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/animations/fade_in_slide.dart';
import 'package:jet/constants/asset_constants.dart';
import 'package:jet/constants/text_constants.dart';
import 'package:jet/features/auth/auth_controllers/sigin_controller.dart';
import 'package:jet/themes/app_theme.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.longestSide,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetConstants.welcombg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      FadeInSlide(
                        duration: .9,
                        child: Text(
                          TextConstants.welcometext,
                          style: TextStyle(
                              color: Color.fromARGB(233, 255, 255, 255),
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                              letterSpacing: 1),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FadeInSlide(
                        duration: .8,
                        child: Text(
                          TextConstants.welcomesubtext,
                          style: TextStyle(
                            color: Color.fromARGB(202, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 40, top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInSlide(
                          duration: .7,
                          direction: FadeSlideDirection.btt,
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed('/signup');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        lightTheme.colorScheme.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Text(
                                      TextConstants.welcomebutton,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInSlide(
                          duration: .8,
                          direction: FadeSlideDirection.btt,
                          child: Text.rich(
                            TextSpan(
                              text: 'I already have an account ',
                              children: [
                                TextSpan(
                                  text: ' Sigin in',
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed("/signin");
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 15),
                          child: FadeInSlide(
                            duration: .9,
                            direction: FadeSlideDirection.btt,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FadeInSlide(
                                duration: .9,
                                direction: FadeSlideDirection.btt,
                                child: GestureDetector(
                                  onTap: () => Get.toNamed("/home"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.15),
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(1000),
                                      ),
                                    ),
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      AssetConstants.getApple(
                                          Theme.of(context).brightness),
                                    ),
                                  ),
                                ),
                              ),
                              FadeInSlide(
                                duration: 1.1,
                                direction: FadeSlideDirection.btt,
                                child: GestureDetector(
                                  onTap: () => controller.googlesign(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.15),
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(1000),
                                      ),
                                    ),
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      AssetConstants.google,
                                    ),
                                  ),
                                ),
                              ),
                              FadeInSlide(
                                duration: 1.3,
                                direction: FadeSlideDirection.btt,
                                child: GestureDetector(
                                  onTap: () => controller.githubsign(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.15),
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(1000),
                                      ),
                                    ),
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      AssetConstants.getGit(
                                          Theme.of(context).brightness),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
