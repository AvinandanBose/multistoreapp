import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/fake_search.dart';

//global variable
List<ItemsData> items =[
  ItemsData(label: 'men'),
  ItemsData(label: 'women'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'bags'),
  ItemsData(label: 'electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'home & garden'),
  ItemsData(label: 'kids'),
  ItemsData(label: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {



  Widget sideNavigator(Size size) {
    return Container(
      height: size.height * 0.8,
      //It means the container's height is 80% of total height of the screen
      width: size.width * 0.2,
      //It means the container's width is 20% of total width of the screen
      color: Colors.grey.shade300,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: size.height / 11, //i.e. 100 px
              child:  Center(
                child: Text(items[index].label),
              ),
            );
          }),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      //It means the container's height is 80% of total height of the screen
      width: size.width * 0.8,
      //It means the container's width is 80% of total width of the screen
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    var sizeNew = MediaQuery.of(context).size;

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
            child: sideNavigator(sizeNew),
          ),
          Positioned(
            //Aligning to bottom left corner
            bottom: 0,
            right: 0,
            child: categView(sizeNew),
          ),
        ],
      ),
    );
  }
}
class ItemsData {

  String label;
  bool isSelected;
  ItemsData({required this.label,  this.isSelected =false});
}