import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neon_student/utils/constants/index.dart';

mixin TextStyleMixin {
  final TextStyle style = GoogleFonts.poppins();

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  TextStyle headingStyle() {
    return style.copyWith(
      fontSize: 18.w,
      fontWeight: semiBold,
      color: AppColors.black80,
    );
  }

  TextStyle bodyStyle({Color? color}) {
    return style.copyWith(
      fontSize: 13.w,
      fontWeight: regular,
      color: color ?? AppColors.black80,
    );
  }

  TextStyle hintStyle() {
    return style.copyWith(
      fontSize: 14.w,
      fontWeight: regular,
      color: AppColors.black60,
    );
  }

  TextStyle textFieldStyle() {
    return style.copyWith(
      fontSize: 14.w,
      fontWeight: regular,
      color: AppColors.black80,
    );
  }

  TextStyle buttonStyle({Color? color}) {
    return style.copyWith(
      fontSize: 16.w,
      fontWeight: semiBold,
      color: color ?? Colors.white,
    );
  }
}
