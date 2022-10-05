import 'package:flutter/material.dart';
import 'package:multistoreapp/categories/electronics_category.dart';
import 'package:multistoreapp/categories/men_category.dart';
import 'package:multistoreapp/widgets/fake_search.dart';

import '../categories/bags_category.dart';
import '../categories/shoes_category.dart';
import '../categories/women_category.dart';

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
final PageController pgcontroller = PageController();

@override
  void initState() {

    super.initState();
  //initState runs at the beginning of the loading of Widgets
  for (var element in items){
    //It selects all the elements to false
    element.isSelected = false;
  }
  //then select 1st item to true when the widget load
  setState(() {
    items[0].isSelected = true;
  });
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      //It means the container's height is 80% of total height of the screen
      width: size.width * 0.2,
      //It means the container's width is 20% of total width of the screen
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){

                pgcontroller.animateToPage(index, duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);//→Controllers helps to select the index and jump to the page according to its index number

                /**** ↑ ****/
                //(As we can see that we select the page also the item
                //in Side Navigator asynchronously , to have it in a synchronous way
                //We need a controller i.e. Page Controller).
                /**** ↓ ****/



              },
              child: Container(
                color: items[index].isSelected==true ?Colors.white :Colors.grey.shade300,
                height: size.height / 11, //i.e. 100 px
                child:  Center(
                  child: Text(items[index].label),
                ),
              ),
            );
          }),
    );
  }
  //↑
  //Here we have taken big sized box , and inside the big sized box ,
  // there is a list of containers with Color grey.
  /*→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→*/

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      //It means the container's height is 80% of total height of the screen
      width: size.width * 0.8,
      //It means the container's width is 80% of total width of the screen
      color: Colors.white,
      child: PageView(
        controller: pgcontroller, //Controller is defined here
        onPageChanged: (value){
          for (var element in items){
            element.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const <Widget>[

          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          Center(child: Text('Accessories category'),),
          Center(child: Text('Home and Garden Category'),),
          Center(child: Text('Kids  Category'),),
          Center(child: Text('Beauty  Category'),),
        ],
      ),
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