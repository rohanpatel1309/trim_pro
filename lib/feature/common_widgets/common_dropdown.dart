import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDropDown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChange;

  const CommonDropDown({super.key, required this.value, required this.items, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          // White border
          borderRadius: BorderRadius.circular(
              8), // Rounded corners (optional)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // Padding inside the border
        child: DropdownButton<String>(
          focusColor: Colors.white,
          value: value,
          dropdownColor: Colors.black,
          // Background color of dropdown items
          style: TextStyle(
            color: Colors.white,
            // Text color of dropdown items
            fontSize: 40.sp,
            fontWeight: FontWeight.w700,
          ),
          iconEnabledColor: Colors.white,
          // Icon color
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    color: Colors.white), // Item text color
              ),
            );
          }).toList(),
          hint: const Text(
            "Please choose a speed",
            style: TextStyle(
              color: Colors.white, // Hint text color
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          onChanged: onChange,
        ),
      ),
    );
  }
}
