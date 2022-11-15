import 'package:flutter/material.dart';

import 'package:multistoreapp/widgets/auth_widgets.dart';

// final TextEditingController _nameController = TextEditingController();
// final TextEditingController _emailController = TextEditingController();
// final TextEditingController _passwordController = TextEditingController();

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({Key? key}) : super(key: key);

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {


  late String name;
  late String email;
  late String password;

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
                    const AuthHeaderLabel(
                      headerLabel: 'Sign Up',
                    ),
                    Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 20),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.purpleAccent,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          name = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Full Name';
                          } else {
                            return null;
                          }
                        },
                        // controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: inputDecoration(
                          labeltext: 'Full Name',
                          hintext: 'Enter Your Full Name',
                          iconpref: const Icon(
                            Icons.person,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        // controller: _emailController,
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
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        // controller: _passwordController,
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
                    HaveAccount(
                      haveAccount: 'already have account?',
                      actionLabel: 'Log In',
                      onpressed: () {},
                    ),
                    AuthMainButton(
                      onPressed: () {
                        if (formKeyForValidation.currentState!.validate()) {
                          // setState(() {
                          //   name = _nameController.text ;
                          //   email = _emailController.text;
                          //   password = _passwordController.text;
                          // });
                          print(name);
                          print(email);
                          print(password);
                        } else {
                          /*     ScaffoldMessenger.of(context).showSnackBar(

                          ); */
                          MyMessageHandler.showSnackBar(message:'Please Fill All Fields' ,key: _scaffoldKey); //→ Call To Function
                        }
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