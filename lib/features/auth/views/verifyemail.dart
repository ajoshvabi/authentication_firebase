import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/constants/asset_constants.dart';
import 'package:jet/constants/text_constants.dart';
import 'package:jet/features/auth/auth_controllers/verifyemailcontroller.dart';
import 'package:jet/themes/app_theme.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});
  final controller = Get.put(VerifyEmailcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: Text("Forgot Password",
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    AssetConstants.verificationshield,
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  Text(
                    TextConstants.verifypagetext,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
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
                          borderSide:
                              BorderSide(color: Get.theme.colorScheme.primary),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.next();
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
                              "Next",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
