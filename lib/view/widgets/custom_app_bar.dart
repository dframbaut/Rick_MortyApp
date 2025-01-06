import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  const CustomAppBar({
    super.key,
    required this.textTheme, required this.titleAppBar,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        titleAppBar,
        style: textTheme.displaySmall,
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight( 55);
}