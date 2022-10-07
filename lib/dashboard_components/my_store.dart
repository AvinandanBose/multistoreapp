import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/appbar_widgets.dart';

class MyStore extends StatelessWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          title: 'MyStore',
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
