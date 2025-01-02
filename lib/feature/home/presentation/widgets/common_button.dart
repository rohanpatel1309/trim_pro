import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          color: Colors.black
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: Colors.white70,size: 22.h,),
            Text(text,style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}