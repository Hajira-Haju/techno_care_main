import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:technocare_app/presentation/bottom_nav_page/bottom_nav_page.dart';
import 'package:technocare_app/presentation/home_page/home_page.dart';
import 'package:technocare_app/presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'TechnoCare',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        // getPages: PageList.pages,
        // initialRoute: AppRoutes.splashScreen,
        home: SplashScreen(),
      ),
    );
  }
}
