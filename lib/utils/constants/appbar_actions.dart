import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neon_student/utils/constants/index.dart';

class AppbarActions {
  static List<Widget>? appBarActions = [
    SvgPicture.asset(Images.search, width: 24.w, height: 24.w),
    SizedBox(width: 16.w),
    SvgPicture.asset(Images.notificationBell, width: 24.w, height: 24.w),
    SizedBox(width: 16.w),
    SvgPicture.asset(Images.cart, width: 24.w, height: 24.w),
    SizedBox(width: 16.w),
    SvgPicture.asset(Images.envelope, width: 24.w, height: 24.w),
    SizedBox(width: 16.w),
  ];
}
