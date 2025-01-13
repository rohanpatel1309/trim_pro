import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.icon, required this.text, required this.onTap,});
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),

        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 55.h,
        width: 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          gradient: LinearGradient(colors: [
            ColorUtils.themeColor1,
            Colors.black12,
           ColorUtils.themeColor2,
          ])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: ColorUtils.commonButtonTextColor,size: 22.h,),
            FittedBox(child: Text(text,style: TextStyle(color: ColorUtils.commonButtonTextColor,fontSize: 30.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}