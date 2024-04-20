import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jet/features/auth/auth_controllers/authentication_controller.dart';
import 'package:jet/themes/app_theme.dart';

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  final animationValue = _animationController.value;
                  final translateY = (1 - animationValue) *
                      100; // Adjust the value to control the distance
                  return Transform.translate(
                    offset: Offset(0.0, translateY),
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
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
                                const Icon(Icons.person),
                                const SizedBox(width: 10),
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  final animationValue = _animationController.value;
                  final translateY = (1 - animationValue) *
                      100; // Adjust the value to control the distance
                  return Transform.translate(
                    offset: Offset(0.0, translateY),
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
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
                          child: GestureDetector(
                            onTap: () {
                              AuthenticationController.instance.logout();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.person),
                                  const SizedBox(width: 10),
                                  Text(
                                    "logout",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
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
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 200,
                ),
                child: Text("data"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 200,
                ),
                child: Text("data"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 200,
                ),
                child: Text("data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
