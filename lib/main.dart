import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multistoreapp/auth/customer_login.dart';
import 'package:multistoreapp/auth/customer_signIn.dart';
import 'package:multistoreapp/main_screen/customer_home.dart';
import 'package:multistoreapp/main_screen/supplierhomescreen.dart';
import 'package:multistoreapp/main_screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: WelcomeScreen(),

      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => const WelcomeScreen(),
        'customer_home': (context) => const CustomerHomeScreen(),
        'supplier_home': (context) => const SupplierHomeScreen(),
        'customer_signup': (context) => const CustomerRegister(),
        'customer_login' : (context) => const CustomerLogin(),
      },
    );
  }
}
