import 'package:flutter/material.dart';
import 'package:vtm_assistant/ui/theme/theme.dart';

abstract class _AppBarAction extends StatelessWidget {
  const _AppBarAction({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context);
}
class AppBarAddAction extends _AppBarAction {
  const AppBarAddAction({Key? key, required super.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ActionButton(
      onTap: onTap,
      child: const _ActionIcon(Icons.add_rounded),
    );
  }
}

class AppBarBackAction extends _AppBarAction {
  const AppBarBackAction({Key? key, required super.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ActionButton(
      onTap: onTap,
      child: const _ActionIcon(Icons.arrow_back_rounded),
    );
  }
}



class _ActionButton extends StatelessWidget {
  const _ActionButton({Key? key, required this.child, required this.onTap})
      : super(key: key);

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        // TODO: Fix button colors
        splashColor: primary.withOpacity(.2),
        highlightColor: primary.withOpacity(.2),
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: child,
        ),
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon(this.icon, {Key? key}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      size: ActionConstants.size,
      icon,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
