import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  final Widget child; // child comes from ShellRoute

  const HomeView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(),
        body: const HomeViewBody(),
      ),
    );
  }
}
