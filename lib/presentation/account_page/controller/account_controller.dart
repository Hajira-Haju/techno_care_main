import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/account_model.dart';

class AccountController extends GetxController {
  final isLoggedIn = false.obs;
  final currentUser = Rxn<UserProfile>();

  void login(UserProfile user) {
    currentUser.value = user;
    isLoggedIn.value = true;
  }

  void logout() {
    currentUser.value = null;
    isLoggedIn.value = false;
  }

}