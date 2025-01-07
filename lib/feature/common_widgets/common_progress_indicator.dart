import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';

class CommonProgressIndicator extends StatelessWidget {
  const CommonProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 120.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorUtils.themeColor1,
              Colors.black,
              ColorUtils.themeColor2,
              Colors.black,
              ColorUtils.themeColor1,
            ],
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10.h,
          children: [
            Text(
              "Loading",
              style: TextStyle(
                  color: ColorUtils.commonButtonTextColor, fontSize: 50.sp,fontWeight: FontWeight.w600),
            ),
            const CircularProgressIndicator(
              color: ColorUtils.commonCircularProgressIndicatorColor,
            ),
          ],
        ),
      ),
    );
  }
}
