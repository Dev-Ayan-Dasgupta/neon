// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:neon_student/presentation/widgets/core/index.dart';
import 'package:neon_student/presentation/widgets/login_section.dart';
import 'package:neon_student/utils/constants/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: CustomOverlays.appbarOverlayLight,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const LoginSection(),
            SizedBox(height: 20.h),
            SplitDivider(leftWidth: 160.w, rightWidth: 160.w, text: 'OR'),
            SizedBox(height: 20.h),
            CustomButton(
              key: const ValueKey('Subscribe'),
              width: 362.w,
              onTap: onSubscribe,
              text: "Subscribe",
            ),
          ],
        ),
      ),
    );
  }

  void onSubscribe() {
    context.goNamed(Routes.checkout);
  }
}
