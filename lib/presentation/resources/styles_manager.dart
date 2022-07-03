import 'package:flutter/cupertino.dart';
import 'font_manager.dart';

TextStyle _style(double fontSize,String fontFamily,Color color,FontWeight fontWeight){
  return TextStyle(fontSize: fontSize,color: color,fontFamily: fontFamily,fontWeight:fontWeight );
}
// regular style
TextStyle getRegularStyle({double fontSize=FontSize.s12, required Color color,}){
  return _style(fontSize,FontConstants.fontFamily,color,FontWeightManager.regular);
}
// light style
TextStyle getLightStyle({double fontSize=FontSize.s12, required Color color,}){
  return _style(fontSize,FontConstants.fontFamily,color,FontWeightManager.light);
}
// medium style
TextStyle getMediumStyle({double fontSize=FontSize.s12, required Color color,}){
  return _style(fontSize,FontConstants.fontFamily,color,FontWeightManager.medium);
}
// semi bold style
TextStyle getSemiBoldStyle({double fontSize=FontSize.s12, required Color color,}){
  return _style(fontSize,FontConstants.fontFamily,color,FontWeightManager.semiBold);
}
// bold style
TextStyle getBoldStyle({double fontSize=FontSize.s12, required Color color,}){
  return _style(fontSize,FontConstants.fontFamily,color,FontWeightManager.bold);
}
