import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/auth_widgets.dart';
import 'package:multistoreapp/widgets/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SupplierRegister extends StatefulWidget {
  const SupplierRegister({Key? key}) : super(key: key);

  @override
  State<SupplierRegister> createState() => _SupplierRegisterState();
}

class _SupplierRegisterState extends State<SupplierRegister> {
  late String storeName;
  late String email;
  late String password;
  late String storeLogo;
  late String _uid;

  bool processing = false;

  CollectionReference suppliers =
  FirebaseFirestore.instance.collection('suppliers');

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  late FileSystemException _pickedImageError;

  void _pickImageFromCamera() async {
    try {
      final XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );

      setState(() {
        _imageFile = pickedImage;
      });
    } on FileSystemException catch (e) {
      setState(() {
        _pickedImageError = e;
      });

      print(_pickedImageError);
      print(e.message);
    }
  }

  void _pickImageFromGallery() async {
    try {
      final XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );

      setState(() {
        _imageFile = pickedImage;
      });
    } on FileSystemException catch (e) {
      setState(() {
        _pickedImageError = e;
      });

      print(_pickedImageError);
      print(e.message);
    }
  }

  Future<void> SignUp() async {
    setState(() {
      processing = true;
    });
    if (formKeyForValidation.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          //Creating User with Email and Password
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          //UploadingCustomerInfo
          firebase_storage.Reference reference = firebase_storage
              .FirebaseStorage.instance
              .ref('supp-images/$email.jpg');

          await reference.putFile(File(_imageFile!.path));

          storeLogo = await reference.getDownloadURL();
          _uid = FirebaseAuth.instance.currentUser!.uid;

          await suppliers.doc(_uid).set({
            'storename': storeName,
            'email': email,
            'storelogo': storeLogo,
            'phone': '',
            'sid': _uid,
            'cover image': '',
          });
          //UploadingCustomerInfo

          //Reset
          formKeyForValidation.currentState!.reset();
          setState(() {
            _imageFile = null;
          });
          //Reset

          Navigator.pushReplacementNamed(context, 'supplier_login'); //PUSH
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false; //Should not show Circular Progress Indicator
            });
            MyMessageHandler.showSnackBar(
                message: 'The password provided is too weak.',
                key: _scaffoldKey); //→ Call To Function
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false; //Should not show Circular Progress Indicator
            });
            MyMessageHandler.showSnackBar(
                message: 'The account already exists for that email',
                key: _scaffoldKey);
          }
        }

      } else {
        setState(() {
          processing = false; //Should not show Circular Progress Indicator
        });
        MyMessageHandler.showSnackBar(
            message: 'Upload Image', key: _scaffoldKey); //→ Call To Function
      }
    } else {
      setState(() {
        processing = false; //Should not show Circular Progress Indicator
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
                    const AuthHeaderLabel(
                      headerLabel: 'Sign Up',
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 20),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.purpleAccent,
                            backgroundImage: _imageFile == null
                                ? null
                                : FileImage(
                              File(_imageFile!.path),
                            ),
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
                                onPressed: () {
                                  _pickImageFromCamera();
                                },
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
                                onPressed: () {
                                  _pickImageFromGallery();
                                },
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
                          storeName = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Full Name';
                          } else {
                            return null;
                          }
                        },
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
                    HaveAccount(
                      haveAccount: 'already have account?',
                      actionLabel: 'Log In',
                      onpressed: () {
                        Navigator.pushReplacementNamed(context, 'customer_login');
                      },
                    ),
                    processing == true
                        ? const CircularProgressIndicator( color: Colors.purple,)
                        : AuthMainButton(
                      onPressed: () async {
                        await SignUp();
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
