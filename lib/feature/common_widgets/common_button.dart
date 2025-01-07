import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onTap, required this.buttonText});

  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            gradient: LinearGradient(

                colors: [
                  ColorUtils.themeColor1,
                 ColorUtils.themeColor2,

                ]),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Text(buttonText,style: TextStyle(fontSize: 40.sp,fontWeight: FontWeight.w900,color: ColorUtils.commonButtonTextColor),),
      ),
    );
  }
}
