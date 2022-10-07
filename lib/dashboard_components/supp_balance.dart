import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/appbar_widgets.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

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