import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neon_student/presentation/bloc/checkBox/check_box_bloc.dart';
import 'package:neon_student/utils/constants/index.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    this.borderColor,
    this.fillColor,
    this.checkColor,
  }) : super(key: key);

  final Color? borderColor;
  final Color? fillColor;
  final Color? checkColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBoxBloc, CheckBoxState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            onCheckBoxTap(context);
          },
          child: Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: state.isChecked
                    ? Colors.transparent
                    : borderColor ?? AppColors.primary,
                width: 0.5.w,
              ),
              borderRadius: BorderRadius.all(Radius.circular(2.w)),
              color: state.isChecked
                  ? fillColor ?? AppColors.primary
                  : Colors.transparent,
            ),
            child: Visibility(
              visible: state.isChecked,
              child: Icon(
                Icons.check,
                size: 10.w,
                color: checkColor ?? Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  void onCheckBoxTap(BuildContext context) {
    final CheckBoxBloc checkBoxBloc = context.read<CheckBoxBloc>();
    checkBoxBloc.add(CheckBoxToggleEvent());
  }
}
