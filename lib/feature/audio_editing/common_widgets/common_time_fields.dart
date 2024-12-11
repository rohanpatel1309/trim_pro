import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "$title1 : ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "$title2 : ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 100.w,
              child: TimeTextFormField(
                controller: controller1,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 100.w,
              child: TimeTextFormField(
                controller: controller2,
              ),
            ),
          ],
        )
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
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        counterText: "",
        // To remove the default text length counter
        filled: true,
        // Ensures the background is filled with color
        fillColor: Colors.white,
        // Background color of the field
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          // Curved corners with 20 radius
          borderSide: const BorderSide(
            color: Colors.grey, // Border color (optional)
            width: 1, // Border width (optional)
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.grey, // Border color when the field is enabled
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.black, // Border color when the field is focused
            width: 2, // Border width when focused (optional)
          ),
        ),
        hintText: "HH:MM:SS",
        // Placeholder text (optional)
        contentPadding: EdgeInsets.only(
            left: 10.w, top: 6.h, bottom: 6.h), // Padding inside the field
      ),
    );
  }
}
