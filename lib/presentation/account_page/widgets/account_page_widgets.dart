import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/account_model.dart';
class AccountWidgets{
  static Widget buildProfileImage(String? imageUrl, bool isLoggedIn) {
    if (!isLoggedIn || imageUrl == null || imageUrl.isEmpty) {
      return const CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xFF7c4c9d),
        child: Icon(Icons.person, size: 50, color: Colors.white),
      );
    }

    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey.shade200,
      backgroundImage: NetworkImage(imageUrl),
      onBackgroundImageError: (_, __) {},
    );
  }
  static Widget buildSupportItem(SupportOption option) {
    return ListTile(
      leading: Icon(option.icon, color: const Color(0xFF7c4c9d)),
      title: Text(
        option.title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFF7c4c9d)),
      onTap: () {
        Get.snackbar(
          option.title,
          '${option.title} support coming soon!',
          backgroundColor: const Color(0xFFe3a446),
          colorText: Colors.white,
        );
      },
    );
  }
}