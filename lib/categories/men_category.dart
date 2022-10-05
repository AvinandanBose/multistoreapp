import 'package:flutter/material.dart';
import 'package:multistoreapp/utilities/categ_list.dart';
import 'package:multistoreapp/widgets/categ_widgets.dart';


class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

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
                  const CategHeader_label(headerLabel: 'Men',),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: GridView.count(
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 70,
                        crossAxisCount: 3,
                        //men.length from List men[] category.dart
                        children: List.generate(men.length, (index) {
                          return SubcategModel(
                            mainCategName: 'men' ,
                            subcategLabel: men[index] ,
                            subCategName:men[index] ,
                            assetName: 'images/men/men$index.jpg',

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
            child: SliderBar(maincategName: 'men',),
          ),
        ],
      ),
    );
  }
}

