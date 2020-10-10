import 'package:flutter/material.dart';

displayDialog(
    {BuildContext context,
    String title,
    callBack,
    TextEditingController textcontroller}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(title),
          content: TextField(
            controller: textcontroller,
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
                await callBack({textcontroller.text});
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
