import 'account_model.dart';
import 'package:flutter/material.dart';
final List<SupportOption> loggedInSupportOptions = [
  SupportOption(title: 'Contact Support', icon: Icons.support_agent),
  SupportOption(title: 'About Us', icon: Icons.info),
];

final List<SupportOption> guestSupportOptions = [
  SupportOption(title: 'Help Center', icon: Icons.help_center),
  SupportOption(title: 'Contact Us', icon: Icons.contact_support),
];