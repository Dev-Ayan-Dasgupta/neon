import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOverlays {
  static const appbarOverlayLight = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}
