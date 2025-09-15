import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.onMenuPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFdfa49b),
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Color(0xFFdfa49b),
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? null
          : onMenuPressed != null
          ? IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFFdfa49b)),
              onPressed: onMenuPressed,
            ) // IconButton
          : null,
      actions: actions,
      elevation: 2,
      shadowColor: const Color(0xFF847b6d),
    ); // AppBar
  }
}
