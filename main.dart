import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:final_project/features/presentation/Onboarding1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'features/zalad/logic/auth_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
            ),
          ),
          home: const MyApp(),
        ),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 100.w,
              height: 100.h,
              child: SvgPicture.asset(
                "assets/images/im1.svg",
                width: 72,
                height: 72,
              )),
          SizedBox(height: 20.h),
          Text(
            "zalada",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
            ),
          ),
        ],
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: Onboarding1(),
    );
  }
}
