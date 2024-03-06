import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_student/presentation/bloc/index.dart';
import 'package:neon_student/presentation/bloc/toggleListItems/toggle_listitems_bloc.dart';
import 'package:neon_student/presentation/widgets/index.dart';
import 'package:neon_student/utils/constants/appbar_actions.dart';
import 'package:neon_student/utils/constants/index.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TextStyleMixin {
  bool isShowBlue = false;
  bool isShowRed = false;
  @override
  Widget build(BuildContext context) {
    final ShowHideBloc showHideBloc = context.read<ShowHideBloc>();

    return Scaffold(
      backgroundColor: AppColors.black20,
      appBar: AppBar(
        leading: Icon(Icons.menu_rounded, size: 24.w),
        actions: AppbarActions.appBarActions,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: CustomOverlays.appbarOverlayLight,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            CoverPictureSection(),
            SizedBox(height: 10.h),
            ElevatedButton(
              key: const ValueKey('BlueButton'),
              onPressed: () {
                setState(() {
                  isShowBlue = true;
                });
              },
              child: Text(
                'Create Blue Box',
                style: bodyStyle(),
              ),
            ),
            SizedBox(height: 10.h),
            isShowBlue
                ? Container(
                    key: const ValueKey('BlueBox'),
                    width: 50.w,
                    height: 50.h,
                    color: Colors.blue,
                  )
                : const SizedBox.shrink(),
            SizedBox(height: 10.h),
            ElevatedButton(
              key: const ValueKey('RedButton'),
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 3));
                setState(() {
                  isShowRed = true;
                });
              },
              child: Text('Create Red Box', style: bodyStyle()),
            ),
            SizedBox(height: 10.h),
            isShowRed
                ? Container(
                    key: const ValueKey('RedBox'),
                    width: 50.w,
                    height: 50.h,
                    color: Colors.red,
                  )
                : const SizedBox.shrink(),
            SizedBox(height: 10.h),
            BlocBuilder<ShowHideBloc, ShowHideState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    showHideBloc.add(ShowHideToggle());
                  },
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: state is HideState
                          ? Colors.transparent
                          : Colors.black,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            BlocBuilder<ShowHideBloc, ShowHideState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    showHideBloc.add(ShowHideToggle());
                  },
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: state is HideState
                          ? Colors.transparent
                          : Colors.black,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: BlocProvider(
                create: (context) =>
                    ToggleListitemsBloc([true, true, true, true, true]),
                child: BlocBuilder<ToggleListitemsBloc, ToggleListitemsState>(
                  builder: (context, state) {
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 5.h);
                      },
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // final isChecked = state.toggleList[index];
                        return InkWell(
                          onTap: () {
                            // BlocProvider.of<ToggleListitemsBloc>(context)
                            //     .add(ToggleListitem(state.toggleList[index]));
                            context
                                .read<ToggleListitemsBloc>()
                                .add(ToggleListitem(index));
                          },
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: state.toggleList[index]
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
