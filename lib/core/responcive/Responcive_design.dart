import 'package:flutter/material.dart';

class ResponciveDesign {
  final BuildContext context;
  final double height;
  final double widths;

  ResponciveDesign(this.context)
      : widths = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;

  bool get isPhone => widths < 400;
  bool get isTablet => widths >= 400 && widths < 900;
  bool get isDesktop => widths >= 900 && widths < 1200;

  // home screen banner
double bannerheight(){
  if(isPhone){
    return 170;
  }else if(isTablet){
    return 100;
  }
  return 350;
}

// home screen categry items
double categryItemsHeight(){
  if(isPhone) return 50;
  if(isTablet) return 70;
  return 80;
}


// home items height and widht
double homeItemHeight(){
  if(isPhone) return 70;
  if(isTablet) return 90;
  return 100;
}


//////////////////////// search page ////////////////////

double searchFieldWidht(){
  if(isPhone) return double.infinity;
  if(isTablet) return 600;
  return 900;
}


}