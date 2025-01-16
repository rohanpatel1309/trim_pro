import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/common_styles.dart';

class TimeFields extends StatelessWidget {
  const TimeFields({
    super.key,
    required this.title1,
    required this.title2,
    required this.controller1,
    required this.controller2,
  });

  final String title1, title2;
  final TextEditingController controller1, controller2;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$title1 : ",
              style: CommonStyles.commonLabelStyle,
            ),

            SizedBox(
              width: 250.w,
              child: TimeTextFormField(
                controller: controller1,
              ),
            ),

          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$title2 : ",
              style: CommonStyles.commonLabelStyle,
            ),

            SizedBox(
              width: 250.w,
              child: TimeTextFormField(
                controller: controller2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class TimeTextFormField extends StatelessWidget {
  const TimeTextFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.datetime,
      maxLength: 8,
      style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        hintText: "HH:MM:SS",
        contentPadding: EdgeInsets.only(
            left: 20.w, top: 6.h, bottom: 6.h),

      ),
    );
  }
}
