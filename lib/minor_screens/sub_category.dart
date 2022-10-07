import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  final String subcategName;
  final String mainCategName;
  const SubCategory({Key? key, required this.subcategName, required this.mainCategName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          subcategName,
          style: const TextStyle(
            fontFamily: 'Acme',
            fontSize: 28,
            letterSpacing: 1.5,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(mainCategName),
      ),
    );
  }
}
