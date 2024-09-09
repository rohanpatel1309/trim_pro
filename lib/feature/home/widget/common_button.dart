import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.icon, required this.text,});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
      height: 90.h,
      width: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        color: Colors.black
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: Colors.white70,size: 22.h,),
          Text(text,style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}