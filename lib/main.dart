import 'package:flutter/material.dart';
import 'package:multistoreapp/main_screen/customer_home.dart';
import 'package:multistoreapp/main_screen/supplierhomescreen.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SupplierHomeScreen(),
    );
  }
}
