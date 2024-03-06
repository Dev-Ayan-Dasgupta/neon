// ignore_for_file: public_member_api_docs, sort_constructors_firsts

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_student/utils/constants/index.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    this.width,
    this.height,
    this.borderRadius,
    this.gradient,
    required this.text,
    this.auxWidget,
    this.fontColor,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Gradient? gradient;
  final String text;
  final Widget? auxWidget;
  final Color? fontColor;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with TextStyleMixin {
  bool isBeingTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /*
      onScaleEnd: (details) {
        setState(() {
          isBeingTapped = false;
        });
      },
      onTapDown: (value) {
        setState(() {
          isBeingTapped = true;
        });
      },
      onTapUp: (value) async {
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          isBeingTapped = false;
        });
      },
      */
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: widget.width ?? 428.w,
        height: widget.height ?? 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius ?? 5.h),
          ),
          color: isBeingTapped ? Colors.transparent : AppColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: buttonStyle(),
            ),
            widget.auxWidget ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
