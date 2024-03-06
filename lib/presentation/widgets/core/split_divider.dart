import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_student/utils/constants/index.dart';

class SplitDivider extends StatelessWidget with TextStyleMixin {
  SplitDivider({
    Key? key,
    required this.leftWidth,
    required this.rightWidth,
    required this.text,
  }) : super(key: key);

  final double leftWidth;
  final double rightWidth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: leftWidth,
          child: Divider(color: AppColors.black40, thickness: 0.8.w),
        ),
        SizedBox(width: 10.w),
        Text(text, style: bodyStyle()),
        SizedBox(width: 10.w),
        SizedBox(
          width: rightWidth,
          child: Divider(color: AppColors.black40, thickness: 0.8.w),
        ),
      ],
    );
  }
}
