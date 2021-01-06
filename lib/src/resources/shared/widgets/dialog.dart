import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

displayDialog(
    {BuildContext context,
    String title,
    Function callBack,
    bool doubleOnly,
    TextEditingController textcontroller}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(title),
          content: TextField(
            controller: textcontroller,
            inputFormatters: doubleOnly
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,9}')),
                  ]
                : [],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Discard'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () async {
                await callBack(textcontroller.text.toString());
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
