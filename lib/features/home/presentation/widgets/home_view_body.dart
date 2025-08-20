import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whats_app_clone/core/router/routes.dart';
import 'package:whats_app_clone/features/chats/presentation/views/chats_view.dart';
import 'package:whats_app_clone/features/updates/presentation/views/updates_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final PageController _pageController;
  bool _isAnimatingRouteChange = false;

  final List<String> _routes = [
    Routes.chats,
    Routes.updates,
    Routes.communities,
    Routes.calls,
  ];

  int _indexFromLocation(String location) {
    for (var i = 0; i < _routes.length; i++) {
      if (location.startsWith(_routes[i])) return i;
    }
    return 0;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // After the first frame, sync page with current router location (deep-link / initial).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loc = GoRouterState.of(context).uri.toString();
      final idx = _indexFromLocation(loc);
      if (idx != _pageController.initialPage) {
        _pageController.jumpToPage(idx);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Called when user swipes pages.
  void _onPageChanged(int index) {
    if (_isAnimatingRouteChange) return;

    // Mark that we're in the middle of an operation so we don't loop
    _isAnimatingRouteChange = true;

    // Update URL for new page
    context.go(_routes[index]);

    // release the lock slightly after animation/route settle
    Future.delayed(const Duration(milliseconds: 350), () {
      if (mounted) setState(() => _isAnimatingRouteChange = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final desiredIndex = _indexFromLocation(currentLocation);

    // If route changed externally (e.g. bottom nav tap called context.go),
    // and we're not currently animating from a page swipe, jump/animate to match.
    if (!_isAnimatingRouteChange &&
        _pageController.hasClients &&
        (_pageController.page?.round() ?? _pageController.initialPage) !=
            desiredIndex) {
      // animate to the new page for visual polish
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        // Use animateToPage for smooth transition when route changed (tap on bottom nav).
        _isAnimatingRouteChange = true;
        _pageController.animateToPage(
          desiredIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        Future.delayed(const Duration(milliseconds: 350), () {
          if (mounted) setState(() => _isAnimatingRouteChange = false);
        });
      });
    }

    return PageView.builder(
      controller: _pageController,
      itemCount: _routes.length,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return const ChatsView();
          case 1:
            return const UpdatesView();
          case 2:
            return Center(child: Text("👥 Communities"));
          case 3:
            return const Center(child: Text("📞 Calls"));
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
