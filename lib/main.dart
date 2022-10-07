import 'package:flutter/material.dart';
import 'package:multistoreapp/main_screen/customer_home.dart';
import 'package:multistoreapp/main_screen/supplierhomescreen.dart';
import 'package:multistoreapp/main_screen/welcome_screen.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: WelcomeScreen(),

      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen' : (context) => const WelcomeScreen(),
        'customer_home' : (context) => const CustomerHomeScreen(),
        'supplier_home' : (context) => const SupplierHomeScreen(),


      },
    );
  }
}
