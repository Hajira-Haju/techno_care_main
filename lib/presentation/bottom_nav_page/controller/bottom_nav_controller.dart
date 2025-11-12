import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNavController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxInt currentIndex = 0.obs;
  final GlobalKey<CurvedNavigationBarState> bottomNavKey = GlobalKey();


}
