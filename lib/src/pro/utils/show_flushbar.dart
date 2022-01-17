import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

void showSnackBar({context, String value, Icon icon}) {
  Flushbar(
    margin: EdgeInsets.only(bottom: 60),
    message: value,
    duration: Duration(seconds: 3),
    backgroundColor: Colors.red,
    backgroundGradient:
        LinearGradient(colors: [Colors.green, Colors.green.shade100]),
    icon: icon,
  )..show(context);
}
