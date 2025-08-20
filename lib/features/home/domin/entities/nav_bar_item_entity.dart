import 'package:flutter/material.dart';

class NavBarItemEntity {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  NavBarItemEntity({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}
