import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account_page/account_page.dart';
import '../home_page/controller/home_page_controller.dart';
import '../home_page/home_page.dart';
import '../products_page/products_page.dart';
import '../service_page/service_page.dart';
import 'controller/bottom_nav_controller.dart';
import 'models/bottom_nav_data.dart';

class CustomBottomNavBar extends StatelessWidget {
  final controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () =>  IndexedStack(
          index: controller.currentIndex.value,
          children: BottomNavData.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            _buildNavItem(Icons.home_outlined, Icons.home, 'Home', 0),
            _buildNavItem(
              Icons.shopping_cart_outlined,
              Icons.shopping_cart,
              'Products',
              1,
            ),
            _buildNavItem(
              Icons.settings_outlined,
              Icons.settings,
              'Services',
              2,
            ),
            _buildNavItem(Icons.person_outline, Icons.person, 'Account', 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData outlinedIcon,
    IconData filledIcon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Obx(() {
        final isSelected = controller.currentIndex.value == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? Colors.orange.withOpacity(0.15)
                    : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isSelected ? filledIcon : outlinedIcon,
            color:
                isSelected ? const Color(0xFFe3a446) : const Color(0xFF7c4c9d),
          ),
        );
      }),
      label: label,
    );
  }
}
