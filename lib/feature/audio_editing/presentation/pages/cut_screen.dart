import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_pro/feature/audio_editing/presentation/bloc/cut_screen_bloc.dart';

@RoutePage(name: 'Cut')
class CutScreen extends StatelessWidget {
  const CutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(child: ScreenChildren());
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<CutScreenBloc>(),
      child: const Column(
        children: [
          FileSelection(),
        ],
      ),
    );
  }
}

/// File selection
class FileSelection extends StatelessWidget {
  const FileSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<CutScreenBloc>(context).add(const CutScreenEvent.pickFile()),
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text("Select File",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Colors.white),),
      ),
    );
  }
}
