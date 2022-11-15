import 'package:flutter/material.dart';

class MyMessageHandler{

  // Using The Key , We can call Snack bar multiple times
  static void showSnackBar({required var key, required String? message}) {
    key.currentState!.showSnackBar //Note Current State Can be Null,
    // when no widget matches to Global Key i.e. ScaffoldMessengerKey
      (
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.yellow,
        padding: const EdgeInsets.symmetric( vertical: 10),
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:Radius.circular(20) ),
        ),
        content: Text(
          message!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Acme',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}