import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_student/utils/constants/index.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 48.w,
          child: CircleAvatar(
            foregroundImage: const AssetImage(Images.profilePhoto),
            radius: 46.w,
          ),
        ),
        Positioned(
          bottom: 10.w,
          right: 0.w,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 24.w,
              height: 24.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black20,
              ),
              child: Center(
                child: Icon(Icons.camera_alt_rounded, size: 16.w),
              ),
            ),
          ),
        )
      ],
    );
  }
}
