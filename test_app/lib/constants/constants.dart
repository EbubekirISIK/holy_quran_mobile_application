import 'dart:ui';

import 'package:flutter/material.dart';

class Constants{
  Constants._();

  static const String title = "Ayetler";
  static TextStyle getTitleTextStyle(){
    return const TextStyle(
      color: Colors.amberAccent, fontWeight: FontWeight.bold, fontSize: 48
    );
  }
}