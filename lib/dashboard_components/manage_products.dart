import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/appbar_widgets.dart';

class Manage_Products extends StatelessWidget {
  const Manage_Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: 'Manage Products',
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}