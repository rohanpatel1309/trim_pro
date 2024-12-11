import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            color: Colors.black,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Text(buttonText,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Colors.white),),
      ),
    );
  }
}
