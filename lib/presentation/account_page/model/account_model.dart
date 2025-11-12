import 'package:flutter/material.dart';
class UserProfile {
  final String name;
  final String email;
  final String phone;
  final String joinDate;
  final String profileImage;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.joinDate,
    required this.profileImage,
  });
}

class SupportOption {
  final String title;
  final IconData icon;

  SupportOption({required this.title, required this.icon});
}
