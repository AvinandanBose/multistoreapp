import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(), // expands the box constraints
        decoration: const BoxDecoration(

          image: DecorationImage(
            image: AssetImage(
              'images/inapp/bgimage.jpg',
            ),
            fit: BoxFit.cover,
          ),

        ),
        child: Column(
          children: const <Widget>[
            Text('Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
