import 'package:flutter/material.dart';

import '../minor_screens/sub_category.dart';

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
              maincategName == 'beauty' ? const Text('') : const Text(
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
              maincategName == 'men' ? const Text('') :const Text(
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
