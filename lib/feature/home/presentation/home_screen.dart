import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/feature/home/widget/common_button.dart';

@RoutePage(name: 'Home')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: AudioEditing(),
    );
  }
}

class AudioEditing extends StatelessWidget {
  const AudioEditing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black54,
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.audiotrack,size: 20.h,),
              Text("Audio Editing",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: 10.h,),
          const Wrap(
            children: [
              CommonButton(icon: CupertinoIcons.scissors_alt,text: "Cut",),
              CommonButton(icon: Icons.merge,text: "Merge",),
              CommonButton(icon: Icons.merge,text: "Cut & Merge",),
              CommonButton(icon: Icons.call_split,text: "Split",),
              CommonButton(icon: Icons.input,text: "Insert",),
            ],
          ),
        ],
      ),
    );
  }
}

