import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/fake_search.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(child: Container(
            height: 500,
            width: 100,
            color: Colors.red,
            //by default it will align to top left corner
            //but we need here is bottom left corner.
          ),
          ),
        ],

      ),
    );
  }
}
