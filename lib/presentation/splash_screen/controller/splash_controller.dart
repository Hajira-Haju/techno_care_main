import 'package:get/get.dart';
import 'package:technocare_app/presentation/bottom_nav_page/bottom_nav_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    navigation();
    super.onInit();
  }

  void navigation() {
    Future.delayed(
      Duration(seconds: 2),
      () => Get.offAll(CustomBottomNavBar()),
    );
  }
}
