import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:whats_app_clone/core/router/routes.dart';
import 'package:whats_app_clone/features/home/domin/entities/nav_bar_item_entity.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // use GoRouterState to get location safely
    final location = GoRouterState.of(context).uri.toString();

    final List<NavBarItemEntity> navItems = [
      NavBarItemEntity(
        icon: FontAwesomeIcons.message,
        selectedIcon: FontAwesomeIcons.solidMessage,
        label: 'Chats',
      ),
      NavBarItemEntity(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: 'Updates',
      ),
      NavBarItemEntity(
        icon: FontAwesomeIcons.users,
        selectedIcon: FontAwesomeIcons.userGroup,
        label: 'Communities',
      ),
      NavBarItemEntity(
        icon: Icons.phone_outlined,
        selectedIcon: Icons.phone,
        label: 'Calls',
      ),
    ];

    int selectedIndex = 0;
    if (location.startsWith(Routes.updates)) selectedIndex = 1;
    if (location.startsWith(Routes.communities)) selectedIndex = 2;
    if (location.startsWith(Routes.calls)) selectedIndex = 3;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: navItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  context.go(Routes.chats);
                  break;
                case 1:
                  context.go(Routes.updates);
                  break;
                case 2:
                  context.go(Routes.communities);
                  break;
                case 3:
                  context.go(Routes.calls);
                  break;
              }
            },
            child: NavItem(item: item, isSelected: selectedIndex == index),
          ),
        );
      }).toList(),
    );
  }
}
