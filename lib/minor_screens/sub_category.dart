import 'package:flutter/material.dart';

import '../widgets/appbar_widgets.dart';

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
        title: AppBarTitle(title: subcategName),
         leading: const AppBarBackButton(),
      ),
      body: Center(
        child: Text(mainCategName),
      ),
    );
  }
}

