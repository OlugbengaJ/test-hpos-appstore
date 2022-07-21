import 'package:flutter/material.dart';

class ButtonRound extends StatelessWidget {
  /// [ButtonRound] provides a customizable button that accepts icon
  /// and color to keep the entire app consistent.
  const ButtonRound({
    Key? key,
    required this.size,
    this.onTap,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.radius,
    this.splashColor,
    this.semanticLabel,
  }) : super(key: key);

  final VoidCallback? onTap;
  final double size;
  final double? radius;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? splashColor;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: onTap ?? () {},
          customBorder: const CircleBorder(),
          splashColor: splashColor ?? Theme.of(context).primaryColor,
          radius: radius,
          child: Icon(
            icon,
            // if icon size is null, use 70% of size to show tap effect
            size: iconSize ?? size * 0.7,
            color: iconColor ?? Theme.of(context).primaryColorLight,
            semanticLabel: semanticLabel,
          ),
        ),
      ),
    );
  }
}
