import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static bool _isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static TextStyle titleLarge(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = _isDarkMode(context);

    return theme.textTheme.titleLarge!.copyWith(
      fontSize: 24.sp,
      color: isDark ? Colors.white : theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bottomNavLabelLarge(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.labelLarge!.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: theme.colorScheme.onSurfaceVariant,
    );
  }
}
