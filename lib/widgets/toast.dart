import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(BuildContext context, String message) {
  final Brightness brightness = Theme.of(context).brightness;
  final Color textColor =
      brightness == Brightness.dark ? Colors.black : Colors.white;
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Theme.of(context).colorScheme.primary,
    textColor: textColor,
    fontSize: 16.0,
  );
}
