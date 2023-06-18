import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/ui/widgets/appbar_widgets/appbar_actions.dart';

const _appBarHeight = 60.0;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.action,
  }) : super(key: key);

  final Widget? action;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: _appBarHeight + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            SizedBox(
              width: 35 + 20,
              // height: 20,
              child: context.router.canPop() ? AppBarBackAction(onTap: context.router.pop) : null,
            ),

            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: action == null ? 15 : 0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium!.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),

              SizedBox(
                width: 35 + 20,
                // height: 20,
                child: action,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);
}
