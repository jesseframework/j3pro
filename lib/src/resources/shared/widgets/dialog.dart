import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

displayDialog(
    {BuildContext? context,
    String? title,
    bool onlyMessage = false,
    Function? callBack,
    bool? doubleOnly,
    TextEditingController? textcontroller}) async {
  return showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(title!),
          content: onlyMessage
              ? SizedBox()
              : TextField(
                  controller: textcontroller,
                  inputFormatters: doubleOnly!
                      ? <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^(\d+)?\.?\d{0,9}')),
                        ]
                      : [],
                ),
          actions: <Widget>[
            FlatButton(
              child: Text(onlyMessage ? 'Ok' : 'Discard'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onlyMessage
                ? SizedBox()
                : FlatButton(
                    child: Text('Save'),
                    onPressed: () async {
                      await callBack!(textcontroller!.text.toString());
                      Navigator.of(context).pop();
                    },
                  )
          ],
        );
      });
}
