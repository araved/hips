import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title;

  ErrorDialog(this.title);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        Center(
          child: FlatButton(
              onPressed: () => Navigator.of(context).pop(), child: Text('Ok')),
        )
      ],
    );
  }
}
