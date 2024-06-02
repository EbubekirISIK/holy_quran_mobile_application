import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper{
  UiHelper._();
  static double getAppTitleWidgetHeight(){
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static EdgeInsets getDefaultPadding(){
    if(ScreenUtil().orientation == Orientation.portrait){
      return EdgeInsets.all(12.h);
    }else{
      return EdgeInsets.all(8.w);
    }
  }
  static TextStyle getAyetNameStyle(){
    return const TextStyle(
      color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 15
    );
  }


  static TextStyle getEnglishNameStyle(){
    return const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30
    );
  }

  static Color getCardColor(int ayetSayi){
    int index = ayetSayi % 20;
    if(index == 0) {
      index = 20; // 20'nin tam katları için doğru rengi seçmek adına
    }
    if(index <=4 || index == 0 ){
      return Colors.redAccent;

    }else if(index <=8){
      return Color(0xFF90EE90);
    }else if(index <=12){
      return Color(0xFFADD8E6);
    }else if(index <=16){
      return Colors.amber.shade500;
    }else {
      return Color(0xFFE6E6FA);
    }

  }
}