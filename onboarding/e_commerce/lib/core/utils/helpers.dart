import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2),
    action: SnackBarAction(label: 'UNDO', onPressed: () {}),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
