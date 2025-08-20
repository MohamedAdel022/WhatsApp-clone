import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/core/theme/app_text_style.dart';
import 'package:whats_app_clone/features/home/domin/entities/nav_bar_item_entity.dart';

class InactiveNavItem extends StatelessWidget {
  final NavBarItemEntity item;

  const InactiveNavItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with Stadium-shaped indicator
          Stack(
            alignment: Alignment.center,
            children: [
              // Stadium-shaped background indicator for selected state
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                width: 60.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              // Icon
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                padding: EdgeInsets.all(8.w),
                child: FittedBox(
                  child: Icon(
                    item.icon,
                    size: 20.r,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          // Label
          FittedBox(
            fit: BoxFit.scaleDown,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              style: AppTextStyle.bottomNavLabelLarge(
                context,
              ).copyWith(fontWeight: FontWeight.w400),
              child: Text(item.label),
            ),
          ),
        ],
      ),
    );
  }
}
