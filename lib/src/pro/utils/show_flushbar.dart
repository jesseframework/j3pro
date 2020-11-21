import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showSnackBar({context, String value, Icon icon}) {
  Flushbar(
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    message: value,
    duration: Duration(seconds: 3),
    backgroundColor: Colors.red,
    backgroundGradient:
        LinearGradient(colors: [Colors.grey, Colors.grey.shade400]),
    icon: icon,
  )..show(context);
}
