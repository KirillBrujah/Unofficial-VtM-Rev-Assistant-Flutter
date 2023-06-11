import 'package:flutter/material.dart';

const _appBarHeight = 60.0;


class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);
}
