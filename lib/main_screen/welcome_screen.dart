import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multistoreapp/main_screen/supplierhomescreen.dart';
import 'package:multistoreapp/widgets/yellow_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const textColors = [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal,
];

ColorizeAnimatedText MyText(String text) {
  return ColorizeAnimatedText(
    text.toUpperCase(),
    textStyle: const TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      fontFamily: 'Acme',
    ),
    colors: textColors,
  );
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool processing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    controller.repeat();
  }

//Dispose once we leave the welcome screen page
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:
            const BoxConstraints.expand(), // expands the box constraints
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/inapp/bgimage.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child:
            SafeArea //Gives a Safe Area to its Child Widget though its parent widget: Container fills the Screen
                (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //-1
            children: <Widget>[
              AnimatedTextKit(
                animatedTexts: [
                  MyText('Welcome'),
                  MyText('Duck Store'),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              // Text(
              //   'Welcome'.toUpperCase(),
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontSize: 30,
              //   ),
              // ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(
                  image: AssetImage('images/inapp/logo.jpg'),
                ),
              ),
              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Acme',
                    color: Colors.lightBlueAccent,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Buy'),
                      RotateAnimatedText('Shop'),
                      RotateAnimatedText('Duck Store'),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, //→ 4
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end, //→ 4
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Suppliers Only',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox //→2
                          (
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white38.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AnimatedLogo(controller: controller), //Refactored
                            YellowButton(
                                width: 0.25,
                                label: 'Log In',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'supplier_login');//change
                                }),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: YellowButton(
                                  width: 0.25,
                                  label: 'Sign Up',
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, 'supplier_signup');//change
                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start, //→5
                children: <Widget>[
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        YellowButton(
                            width: 0.25,
                            label: 'Log In',
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'customer_login');
                            }),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: YellowButton(
                              width: 0.25,
                              label: 'Sign Up',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, 'customer_signup');
                              }),
                        ),
                        AnimatedLogo(controller: controller), //Replaced
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GoogleFacebookLogin(
                        onPressed: () {},
                        label: 'Google',
                        child: const Image(
                          image: AssetImage('images/inapp/google.jpg'),
                        ),
                      ),
                      GoogleFacebookLogin(
                        onPressed: () {},
                        label: 'Facebook',
                        child: const Image(
                          image: AssetImage('images/inapp/facebook.jpg'),
                        ),
                      ),
                      processing == true
                          ? const CircularProgressIndicator()
                          : GoogleFacebookLogin(
                              onPressed: () async {
                                setState(() {
                                  processing = true;
                                });
                                await FirebaseAuth.instance.signInAnonymously();
                                Navigator.pushReplacementNamed(
                                    context, 'customer_home');
                              },
                              label: 'Guest',
                              child: const Icon(
                                Icons.person,
                                size: 55,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.view,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: controller.value * 2 * pi,
          child: child,
        );
      },
      child: const Image(
        image: AssetImage('images/inapp/logo.jpg'),
      ),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Widget child;
  const GoogleFacebookLogin({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 50,
              child: child,
            ),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
