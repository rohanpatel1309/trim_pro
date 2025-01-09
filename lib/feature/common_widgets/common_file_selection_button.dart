import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';
import 'package:trim_pro/feature/common_widgets/common_button.dart';

class CommonFileSelectionButton extends StatelessWidget {
  const CommonFileSelectionButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.fileName,
  });

  final String buttonText;
  final VoidCallback onTap;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        CommonButton(
          onTap: onTap,
          buttonText: buttonText,
        ),
        Visibility(
          visible: fileName.isNotEmpty,
          child: Text(
            "File: ${fileName.split("/").last}",
            style: TextStyle(
                color: ColorUtils.commonButtonTextColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
