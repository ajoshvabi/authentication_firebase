import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jet/widgets/toast.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  bool isFirstTime = true;
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setFirstScreen);
  }

  _setFirstScreen(User? user) {
    if (isFirstTime) {
      isFirstTime = false;
      Future.delayed(const Duration(seconds: 2), () {
        user == null ? Get.offAllNamed("/welcome") : Get.offAllNamed("/c");
      });
    } else {
      user == null ? Get.offAllNamed("/welcome") : Get.offAllNamed("/c");
    }
  }
  // _setFirstScreen(User? user) {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     user == null ? Get.offAllNamed("/welcome") : Get.offAllNamed("/c");
  //   });
  // }

  // ! User With Email And Password

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final userId = userCredential.user?.uid;
      return userId;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          log(e.toString());
          showToast(Get.context!, "Email  already registered!✅");
          Get.offAndToNamed("/signin");
          return null;
        }
        log(e.toString());
      }
    }
    return null;
  }

  // ! resetpassword

  Future<bool> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      log("logined");
      return true;
    } catch (_) {
      log(_.toString());
      return false;
    }
  }

  // ! logout

  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }

  // ! Google signin

  Future<UserCredential?> signInWithGoogle() async {
    log("authentication controller");
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        log("User canceled sign-in.");
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      log("error:$e");
      return null;
    }
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  // ! Github signin

  Future<UserCredential?> signInWithGitHub() async {
    try {
      GithubAuthProvider githubProvider = GithubAuthProvider();
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithProvider(githubProvider);
      return userCredential;
    } catch (error) {
      log("Error signing in with GitHub: $error");
      return null;
    }
  }
}
