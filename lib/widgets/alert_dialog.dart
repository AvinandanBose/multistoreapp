import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialogue {
  static showMyDialogue({
    required BuildContext context,
    required String dgTitle,
    required String dgContent,
    required Function tabNo,
    required Function tabYes,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Center(
          child: Text(
            dgTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.purpleAccent,
            ),
          ),
        ),
        content: Text(
          dgContent,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              tabNo();
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              tabYes();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}