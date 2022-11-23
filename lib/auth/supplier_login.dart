import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/auth_widgets.dart';
import 'package:multistoreapp/widgets/snackbar.dart';

class SupplierLogin extends StatefulWidget {
  const SupplierLogin({Key? key}) : super(key: key);

  @override
  State<SupplierLogin> createState() => _SupplierLoginState();
}

class _SupplierLoginState extends State<SupplierLogin> {
  late String email;
  late String password;

  bool processing = false;

  Future<void> LogIn() async {
    setState(() {
      processing = true;
    });
    if (formKeyForValidation.currentState!.validate()) {
      try {
        //SignIn User with Email and Password
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        //Reset
        formKeyForValidation.currentState!.reset();

        Navigator.pushReplacementNamed(context, 'supplier_home'); //PUSH
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            processing = false;
          });
          MyMessageHandler.showSnackBar(
              message: 'No user found.', key: _scaffoldKey);
        } else if (e.code == 'wrong-password') {
          setState(() {
            processing = false;
          });
          MyMessageHandler.showSnackBar(
              message: 'Wrong Password provided for that User.',
              key: _scaffoldKey);
        }
      }
    } else {
      setState(() {
        processing = false;
      });
      MyMessageHandler.showSnackBar(
          message: 'Please Fill All Fields',
          key: _scaffoldKey); //→ Call To Function
    }
  }

  final GlobalKey<FormState> formKeyForValidation = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>(); //→ Key
  bool passwordVisibility = true;
  bool isPassTextVisibility = true;
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKeyForValidation,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: AuthHeaderLabel(
                        headerLabel: 'Log In',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Email';
                          } else if (value.isValidEmail() == true) {
                            return null;
                          } else if (value.isValidEmail() == false) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: textFormDecoration.copyWith(
                          labelText: 'Email Address',
                          hintText: 'Enter Your Email Address',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Password';
                          } else {
                            return null;
                          }
                        },
                        obscureText: isPassTextVisibility,
                        decoration: textFormDecoration.copyWith(
                          labelText: 'Password',
                          hintText: 'Enter Your Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.purple,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                                isPassTextVisibility = !isPassTextVisibility;
                              });
                            },
                            icon: passwordVisibility
                                ? const Icon(
                              Icons.remove_red_eye,
                              color: Colors.purple,
                            )
                                : const Icon(
                              Icons.visibility_off,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    HaveAccount(
                      haveAccount: 'Don\'t Have Account?',
                      actionLabel: 'Sign Up',
                      onpressed: () {
                        Navigator.pushReplacementNamed(
                            context, 'customer_signup');
                      },
                    ),
                    processing == true
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    )
                        : AuthMainButton(
                      onPressed: () async {
                        await LogIn();
                      },
                      mainButtonLabel: 'Sign Up',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
