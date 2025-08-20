import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/home/domin/entities/nav_bar_item_entity.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/active_nav_item.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/inactive_nav_item.dart';

class NavItem extends StatelessWidget {
  final NavBarItemEntity item;
  final bool isSelected;

  const NavItem({super.key, required this.item, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.elasticOut),
            ),
            child: child,
          ),
        );
      },
      child: isSelected
          ? ActiveNavItem(key: ValueKey('active_${item.label}'), item: item)
          : InactiveNavItem(
              key: ValueKey('inactive_${item.label}'),
              item: item,
            ),
    );
  }
}
