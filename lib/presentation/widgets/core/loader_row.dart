import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderRow extends StatelessWidget {
  const LoaderRow({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        SpinKitFadingCircle(
          color: color ?? Colors.white,
          size: width ?? 20.w,
        ),
      ],
    );
  }
}
