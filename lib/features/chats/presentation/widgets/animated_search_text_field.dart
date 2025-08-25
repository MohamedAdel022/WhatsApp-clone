import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/custom_search_text_field.dart';

class AnimatedSearchTextField extends StatefulWidget {
  const AnimatedSearchTextField({super.key});

  @override
  State<AnimatedSearchTextField> createState() =>
      _AnimatedSearchTextFieldState();
}

class _AnimatedSearchTextFieldState extends State<AnimatedSearchTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  final FocusNode _searchFocusNode = FocusNode();
  final FocusNode _overlaySearchFocusNode = FocusNode();
  bool _isSearchFocused = false;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _searchFocusNode.addListener(_onFocusChanged);
    _overlaySearchFocusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_searchFocusNode.hasFocus && !_isSearchFocused) {
      setState(() {
        _isSearchFocused = true;
      });
      _showOverlay();
      _animationController.forward();
      // Transfer focus to overlay text field
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchFocusNode.unfocus();
        _overlaySearchFocusNode.requestFocus();
      });
    } else if (!_overlaySearchFocusNode.hasFocus && _isSearchFocused) {
      setState(() {
        _isSearchFocused = false;
      });
      _animationController.reverse().then((_) {
        _hideOverlay();
      });
    }
  }

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => AnimatedBuilder(
        animation: _slideAnimation,
        builder: (context, child) {
          final statusBarHeight = MediaQuery.of(context).padding.top;
          // The overlay slides down from above the status bar to its final position
          final double overlayTop =
              statusBarHeight * (1 + _slideAnimation.value);
          return Positioned(
            top: overlayTop,
            left: 0,
            right: 0,
            child: Material(
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: CustomSearchTextField(
                  focusNode: _overlaySearchFocusNode,
                ),
              ),
            ),
          );
        },
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideOverlay();
    _animationController.dispose();
    _searchFocusNode.dispose();
    _overlaySearchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _slideAnimation.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _isSearchFocused
                ? const SizedBox.shrink()
                : CustomSearchTextField(focusNode: _searchFocusNode),
          ),
        );
      },
    );
  }
}
