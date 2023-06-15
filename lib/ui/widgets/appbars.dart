import 'package:flutter/material.dart';

const _appBarHeight = 60.0;

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primary,
      ),
      child: Row(
        children: [
          Expanded(child: Text(title)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);
}
