import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/gen/assets.gen.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';

// TODO: Rework icons
class DetailsNavBar extends StatelessWidget {
  const DetailsNavBar({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final activeColor = colorScheme.primary;
    final inactiveColor = colorScheme.secondary;
    return BottomNavyBar(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      showElevation: false,
      itemCornerRadius: CommonConstants.radius.x,
      backgroundColor: Colors.transparent,

      items: [
        BottomNavyBarItem(
          icon: Center(child: Icon(Icons.add)),
          title: Text(s.general),
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          icon: Assets.svg.dumbbellSolid.svg(
            height: 20,
            colorFilter: ColorFilter.mode(
                tabsRouter.activeIndex == 1 ? activeColor : inactiveColor,
                BlendMode.srcIn),
          ),
          title: Text(s.attributes),
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          icon: Assets.svg.gunSolid.svg(
            height: 20,
            colorFilter: ColorFilter.mode(
                tabsRouter.activeIndex == 2
                    ? activeColor
                    : inactiveColor,
                BlendMode.srcIn),
          ),
          title: Text(s.skills),
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.add),
          title: Text(s.disciplines),
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          icon: Assets.svg.ellipsisSolid.svg(
            height: 20,
            colorFilter: ColorFilter.mode(
                tabsRouter.activeIndex == 4
                    ? activeColor
                    : inactiveColor,
                BlendMode.srcIn),
          ),
          title: Text(s.other),
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
      ],
      selectedIndex: tabsRouter.activeIndex,
      onItemSelected: tabsRouter.setActiveIndex,
    );
  }
}

