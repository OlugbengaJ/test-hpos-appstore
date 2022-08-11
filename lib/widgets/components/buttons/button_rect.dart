import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';

class ButtonRect extends StatelessWidget {
  const ButtonRect({
    Key? key,
    this.color,
    this.radius,
    this.padding,
    this.child,
    this.tapHandler,
  }) : super(key: key);

  final Color? color;
  final BorderRadius? radius;
  final EdgeInsets? padding;
  final Widget? child;
  final VoidCallback? tapHandler;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 200,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: AppColors.primary),
          borderRadius: radius),
      child: InkWell(
        onTap: tapHandler,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
