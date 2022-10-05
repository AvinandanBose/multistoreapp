import 'package:flutter/material.dart';
import 'package:multistoreapp/utilities/categ_list.dart';

import '../minor_screens/sub_category.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
            'Men',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: GridView.count(
              crossAxisSpacing: 15,
              mainAxisSpacing: 70,
              crossAxisCount: 3,
              //men.length from List men[] category.dart
              children: List.generate(men.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubCategory(
                          subcategName: men[index],
                          mainCategName: 'men',
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                        width: 70,
                        //from images/men/men[0----n].jpg
                        child: Image(
                            image: AssetImage('images/men/men$index.jpg')),
                      ),
                      Text(men[index]),
                    ],
                  ),
                );
              }),
            ))
      ],
    );
  }
}
