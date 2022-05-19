import 'package:flutter/material.dart';

showAlertDialog({BuildContext context, String title, String content}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? "",style: TextStyle(color: Colors.blue),),
          content: Text(content ?? ""),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Continue'),
              ),
            ),
          ],
        );
      });
}
