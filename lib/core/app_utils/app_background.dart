import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';

class AppBackground extends StatelessWidget {
  const AppBackground(
      {super.key, required this.child, required this.titleText});

  final String titleText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(ScreenUtil().screenWidth, 35.h),
            child: Container(
              height: 35.h,
              padding: EdgeInsets.only(top: 5.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorUtils.themeColor1,
                    Colors.black,
                    ColorUtils.themeColor2,
                    Colors.black,

                    ColorUtils.themeColor2,
                    Colors.black,

                    ColorUtils.themeColor1,

                  ],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon:  Icon(
                          Icons.arrow_back_ios_sharp,
                          color: ColorUtils.commonButtonTextColor,
                          size: 13.h,
                        ),
                        onPressed: () => context.router.back(),
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        titleText,
                        style: TextStyle(
                            color: ColorUtils.commonButtonTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 50.sp),
                      )),
                ],
              ),
            )),
        body: Container(
            padding: EdgeInsets.only(top: 30.h),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black,
                  Colors.black87,
                ],
              ),
            ),
            child: child),
      ),
    );
  }
}
