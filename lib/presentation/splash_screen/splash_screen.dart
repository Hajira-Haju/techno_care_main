import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:technocare_app/presentation/splash_screen/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [SizedBox(width: 40,),
              Image.asset('assets/technocare_logo.png'),
            ],
          ),
        ],
      ),
    );
    
  }
}
