import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/home_provider.dart';
import '../resources/color_manager.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          index == 1
              ? Stack(
                  children: [
                    Image.asset(
                        Provider.of<HomeProvider>(context).grid[index!].image!,
                        fit: BoxFit.cover),
                    Positioned(
                      right: 50,
                      bottom: 30,
                      left: 8,
                      top: 10,
                      child: Icon(
                        Icons.close,
                        color: ColorManager.white,
                        size: 40,
                      ),
                    ),
                  ],
                )
              : Image.asset(
                  Provider.of<HomeProvider>(context).grid[index!].image!),
          Text(Provider.of<HomeProvider>(context).grid[index!].title!,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
