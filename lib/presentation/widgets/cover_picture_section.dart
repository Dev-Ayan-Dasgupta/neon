import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_student/presentation/widgets/index.dart';
import 'package:neon_student/utils/constants/index.dart';

class CoverPictureSection extends StatelessWidget with TextStyleMixin {
  CoverPictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.w),
      child: Stack(
        children: [
          SizedBox(
            height: 140.h,
            width: 428.w,
            child: Image.asset(Images.profileWallpaper, fit: BoxFit.fill),
          ),
          Container(height: 140.h, width: 428.w, color: Colors.black38),
          Positioned(
            top: 16.h,
            left: 16.w,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.camera_alt_rounded,
                size: 24.w,
                color: AppColors.black20,
              ),
            ),
          ),
          Positioned(
            left: 56.w,
            top: 21.h,
            child: const ProfilePicture(),
          ),
          Positioned(
            left: 176.w,
            top: 48.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Avantika Shah", style: bodyStyle(color: Colors.white)),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 100.w,
                  child: Divider(color: Colors.white, height: 1.w),
                ),
                SizedBox(height: 5.h),
                Text("Prime User", style: bodyStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
