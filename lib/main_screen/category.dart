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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            //Aligning to bottom left corner
            bottom: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height*0.8,
              //It means the container's height is 80% of total height of the screen
              width: MediaQuery.of(context).size.width*0.2,
              //It means the container's width is 20% of total width of the screen
              color: Colors.red,
            ),
          ),
          Positioned(
            //Aligning to bottom left corner
            bottom: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height*0.8,
              //It means the container's height is 80% of total height of the screen
              width: MediaQuery.of(context).size.width*0.8,
              //It means the container's width is 80% of total width of the screen
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
