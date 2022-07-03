import 'package:flutter/material.dart';

class ColorManager{

  static Color lightGreen=HexColor.fromHex("#07826D");
  static Color darkGreen=HexColor.fromHex("#004E41");
  static Color green=HexColor.fromHex("#5bbd59");
  static Color blueLightGreen=HexColor.fromHex("#2bb9b5");
  static Color blueDarkGreen=HexColor.fromHex("#229a96");

  static Color darkGrey=HexColor.fromHex("#004E41");
  static Color grey=HexColor.fromHex("#737477");
  static Color lightGrey=HexColor.fromHex("#9E9E9E");

  static Color grey1=HexColor.fromHex("#707070");
  static Color grey2=HexColor.fromHex("#797979");
  static Color white=HexColor.fromHex("#FFFFFF");
  static Color error=HexColor.fromHex("#e61f34");//red color
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString =hexColorString.replaceAll('#','');
    if(hexColorString.length==6){
      hexColorString = 'FF'+hexColorString;
    }
    return Color(int.parse(hexColorString,radix: 16));
  }

}