import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/yellow_button.dart';

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
            children: <Widget>[
              Text(
                'Welcome'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 120,
                width: 200,
                child: Image(
                  image: AssetImage('images/inapp/logo.jpg'),
                ),
              ),
              Text(
                'Shop'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
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
              const SizedBox(
                height: 6,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: const BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage('images/inapp/logo.jpg'),
                    ),
                    YellowButton(
                        width: 0.25, label: 'Log In', onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: YellowButton(
                          width: 0.25, label: 'Sign Up', onPressed: () {}),
                    )
                  ],
                ),
              ),
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
                        width: 0.25, label: 'Log In', onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: YellowButton(
                          width: 0.25, label: 'Sign Up', onPressed: () {}),
                    ),
                    const Image(
                      image: AssetImage('images/inapp/logo.jpg'),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white38,
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: (){},
                        child: Column(
                          children: const <Widget>[
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Image(
                                image: AssetImage('images/inapp/google.jpg'),
                              ),
                            ),
                            Text(
                              'Google',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
