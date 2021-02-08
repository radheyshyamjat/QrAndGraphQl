import 'package:flutter/widgets.dart';
class SizeConfig{
  static double screenWidth;
  static double screenHeight;
  static double blockSizeWidth = 0;
  static double blockSizeHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double widthMultiplier;
  static double heightMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
    blockSizeWidth = screenWidth/100;
    blockSizeHeight = screenHeight/100;
    textMultiplier = blockSizeHeight;
    imageSizeMultiplier = blockSizeWidth;
    heightMultiplier = blockSizeHeight;
    widthMultiplier = blockSizeWidth;
    print('screen width : $screenWidth');
    print('screen height : $screenHeight');
    print('screen multiplier height : $heightMultiplier');
    print('screen width multiplier : $widthMultiplier');
    print('screen block height : $blockSizeHeight');
    print('screen block width : $blockSizeWidth');
    print('screen block text multiplyer : $textMultiplier');

     double height(double height){
      double finalHeight = (height/6.8)*blockSizeHeight;
      return finalHeight;
    }
  }
}

double setHeight(double height) {
  double finalHeight = (height / 6.8) * SizeConfig.blockSizeHeight;
  return finalHeight;
}

double setWidth(double width) {
  double finalWidth = (width / 4.1) * SizeConfig.blockSizeWidth;
  return finalWidth;
}
