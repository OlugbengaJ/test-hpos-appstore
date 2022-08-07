import 'package:flutter/material.dart';

/// [ButtonRound] provides a customizable button that accepts icon
/// and color to keep the entire app consistent.
class ButtonRound extends StatelessWidget {
  const ButtonRound({
    Key? key,
    this.size = 24.0,
    this.color,
    this.border,
    this.icon,
    this.iconColor,
    this.iconSize = 24.0 * 0.7,
    this.radius,
    this.splashColor,
    this.semanticLabel,
    this.onTap,
  }) : super(key: key);

  /// [onTap] is the callback handler of the button.
  ///
  /// If null, the button is set as disabled.
  final VoidCallback? onTap;

  /// [size] is the size of the button and defaults to 24.0.
  final double size;

  /// [radius] affects the inkwell radius.
  final double? radius;

  /// Background color of the button.
  final Color? color;

  /// Defines the border of the button.
  final BoxBorder? border;

  /// [icon] is optional and could be a [Widget] or an [IconData]
  /// to be displayed on the button.
  final dynamic icon;

  /// [iconSize] is the size of the icon and defaults to 70% of [size].
  /// Ensure this value is less than [size].
  final double iconSize;

  /// [iconColor] is the color of the icon and defaults to primaryColorLight
  final Color? iconColor;

  /// [splashColor] is the color of the splash and defaults to primaryColor
  final Color? splashColor;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: size,
        height: size,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: color, border: border),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          splashColor: splashColor,
          radius: radius,
          child: _getIcon(),
        ),
      ),
    );
  }

  Widget _getIcon() {
    if (icon.runtimeType == IconData || icon == null) {
      // debugPrint(icon.runtimeType.toString());
      return Icon(
        icon,
        size: iconSize,
        color: iconColor,
        semanticLabel: semanticLabel,
      );
    }

    if (icon.runtimeType == ImageIcon) {
      final ImageIcon imageIcon = icon;
      final double padding = (size - iconSize) / 2;

      return Padding(
        padding: EdgeInsets.all(padding),
        child: ImageIcon(
          imageIcon.image,
          color: imageIcon.color ?? iconColor,
          semanticLabel: semanticLabel,
        ),
      );
    }

    return icon;
  }
}
