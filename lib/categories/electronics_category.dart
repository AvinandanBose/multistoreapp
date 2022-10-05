import 'package:flutter/material.dart';
import 'package:multistoreapp/utilities/categ_list.dart';
import 'package:multistoreapp/widgets/categ_widgets.dart';


class ElectronicsCategory extends StatelessWidget {
  const ElectronicsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0, //bottom 0, left 0 as to align it with bottom left corner
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.8, //We are using 80% of Screen as height
              width: MediaQuery.of(context).size.width *
                  0.75, //We are using 75% as Width , 5% kept for Slider Bar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CategHeader_label(headerLabel: 'Electronics',),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: GridView.count(
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 70,
                        crossAxisCount: 3,
                        //men.length from List men[] category.dart
                        children: List.generate(electronics.length, (index) {
                          return SubcategModel(
                            mainCategName: 'electronics' ,
                            subcategLabel: electronics[index] ,
                            subCategName:electronics[index] ,
                            assetName: 'images/electronics/electronics$index.jpg',

                          );
                        }),
                      ))
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0, // bottom : 0 and right : 0 → bottom right of the screen
            child: SliderBar(maincategName: 'Electronics',),
          ),
        ],
      ),
    );
  }
}

