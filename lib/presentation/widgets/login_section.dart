// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:neon_student/presentation/bloc/index.dart';
import 'package:neon_student/presentation/widgets/core/index.dart';
import 'package:neon_student/presentation/widgets/core/loader_row.dart';
import 'package:neon_student/utils/constants/index.dart';
import 'package:neon_student/utils/helpers/index.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> with TextStyleMixin {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    initializeControllers();
  }

  void initializeControllers() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.black40,
          width: 0.5.w,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.w)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            key: const ValueKey('Logo'),
            alignment: Alignment.center,
            child: SizedBox(
              width: 94.w,
              height: 55.h,
              child: const Image(image: AssetImage(Images.logo)),
            ),
          ),
          SizedBox(height: 24.h),
          Text("Login", style: headingStyle()),
          SizedBox(height: 24.h),
          CustomTextField(
            key: const ValueKey('EmailAddress'),
            controller: _emailController,
            onChanged: (p0) {},
            hintText: "Email Address",
          ),
          SizedBox(height: 16.h),
          BlocBuilder<ShowHideBloc, ShowHideState>(
            builder: (context, state) {
              return CustomTextField(
                key: const ValueKey('Password'),
                controller: _passwordController,
                onChanged: (p0) {},
                hintText: "Password",
                obscureText: state.isHide,
                maxLines: 1,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: InkWell(
                    key: const ValueKey('ShowHide'),
                    onTap: () {
                      onShowHide(context);
                    },
                    child: Icon(
                      state.isHide
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.black60,
                      size: 20.w,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BlocBuilder<CheckBoxBloc, CheckBoxState>(
                    builder: (context, state) {
                      return const CustomCheckbox(
                        borderColor: AppColors.black80,
                        fillColor: AppColors.black80,
                      );
                    },
                  ),
                  SizedBox(width: 10.w),
                  Text('Remember me', style: bodyStyle()),
                ],
              ),
              Flexible(
                child: Text(
                  "Forgot Password?",
                  style: bodyStyle(color: AppColors.red100),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          BlocConsumer<LoginBloc, LoginState>(
            listener: listenLoginStates,
            builder: (context, state) {
              return CustomButton(
                key: const ValueKey('Login'),
                onTap: () {
                  onLogin(context);
                },
                text: "Login",
                auxWidget: state is LoginLoading ? const LoaderRow() : null,
              );
            },
          ),
        ],
      ),
    );
  }

  void onShowHide(BuildContext context) {
    final ShowHideBloc showHideBloc = context.read<ShowHideBloc>();
    showHideBloc.add(ShowHideToggle());
  }

  void listenLoginStates(BuildContext context, LoginState state) {
    if (state is LoginLoading) {
      showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const SizedBox.shrink();
        },
      );
    } else if (state is LoginSuccess) {
      context.goNamed(Routes.dashboard);
    } else if (state is LoginError) {
      context.pop();
      showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Text("Login Error", style: headingStyle()),
            content: Text(state.message, style: bodyStyle()),
            actions: [
              Material(
                child: CustomButton(
                  onTap: () {
                    context.pop();
                  },
                  text: "Close",
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void onLogin(BuildContext context) {
    // context.goNamed(Routes.dashboard);
    log("Login API Request -> ${{
      "emailId": _emailController.text,
      "userTypeId": 1,
      "isUAEPass": false,
      "uaePassCode": "",
      "password": EncryptDecrypt.encrypt(_passwordController.text),
      "deviceId": "1AD8E712-1896-473F-94E6-306CD3A4B9B3",
      "registerDevice": false,
      "deviceName": "iPhone 14 Pro Max",
      "deviceType": "iOS",
      "appVersion": "1.0.0",
      "fcmToken": "",
    }}");
    final LoginBloc loginBloc = context.read<LoginBloc>();
    loginBloc.add(LoginAttempt(loginRequest: {
      "emailId": _emailController.text,
      "userTypeId": 1,
      "isUAEPass": false,
      "uaePassCode": "",
      "password": EncryptDecrypt.encrypt(_passwordController.text),
      "deviceId": "1AD8E712-1896-473F-94E6-306CD3A4B9B3",
      "registerDevice": false,
      "deviceName": "iPhone 14 Pro Max",
      "deviceType": "iOS",
      "appVersion": "1.0.0",
      "fcmToken": "",
    }));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
