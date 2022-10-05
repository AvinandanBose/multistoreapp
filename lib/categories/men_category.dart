import 'package:flutter/material.dart';
import 'package:multistoreapp/utilities/categ_list.dart';

import '../minor_screens/sub_category.dart';

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

class SliderBar extends StatelessWidget {
  final String maincategName;
  const SliderBar({
    Key? key, required this.maincategName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width *
          0.05, //0.05 + 0.75 = 80% , here 0.05 is preserved
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: RotatedBox //Turning it by 270 degree and if we write inside it will get 270 deg direction
          (
          quarterTurns: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                '<<',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 10,
                ),
              ),
              Text(
                maincategName.toUpperCase(),
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 10,
                ),
              ),
              const Text(
                '>>',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubcategModel extends StatelessWidget {
  final String mainCategName;
  final String subCategName;
  final String assetName;
  final String subcategLabel;
  const SubcategModel({
    Key? key,
    required this.mainCategName,
    required this.assetName,
    required this.subcategLabel,
    required this.subCategName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategory(
              subcategName: subCategName,
              mainCategName: mainCategName,
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
                image:
                    AssetImage(assetName)),
          ),
          Text(subcategLabel),
        ],
      ),
    );
  }
}

class CategHeader_label extends StatelessWidget {
  final String headerLabel;
  const CategHeader_label({
    Key? key, required this.headerLabel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        headerLabel,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
