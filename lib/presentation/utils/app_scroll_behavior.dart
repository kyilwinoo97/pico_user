import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppScrollBehavior extends MaterialScrollBehavior{

  @override
  Set<PointerDeviceKind> get dragDevices =>{
    PointerDeviceKind.touch,
    //for web
    // PointerDeviceKind.mouse,
    // PointerDeviceKind.trackpad,
  };
}