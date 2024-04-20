import 'dart:ui';

class AssetConstants {
  static const String logo = 'assets/logo.png';
  static const String logodark = 'assets/logodark.png';
  static const String welcombg = 'assets/w.jpg';
  static const String applelight = 'assets/apple.png';
  static const String appledark = 'assets/appledark.png';
  static const String google = 'assets/google.png';
  static const String github = 'assets/githubdark.png';
  static const String githubdark = 'assets/github.png';
  static const String verificationshield = 'assets/verificationshield.png';

  static String getGit(Brightness brightness) {
    return brightness == Brightness.light ? github : githubdark;
  }

  static String getApple(Brightness brightness) {
    return brightness == Brightness.light ? applelight : appledark;
  }

  static String getLogo(Brightness brightness) {
    return brightness == Brightness.light ? logo : logodark;
  }

  // static String getGithub(Brightness brightness) {
  //   return brightness == Brightness.light ? githubdark : github;
  // }

  static get brightness => null;
}
