import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';

class SelectionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;

  const SelectionButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.h),
            border: Border.all(color: ColorUtils.commonButtonTextColor,width: 2),
            gradient: isSelected ? LinearGradient(colors: [
              ColorUtils.themeColor1,
              Colors.black12,
              ColorUtils.themeColor2,
            ]) : null),
        child: Text(
          text,
          style: TextStyle(
            color: ColorUtils.commonButtonTextColor,
            fontSize: 40.sp,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
