import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hpos_appstore/utils/colors.dart';

typedef SelectionFunction = bool Function();

/// [ButtonCircleState] provides a customizable circle button that can observe
/// an outer state and decides whether to appear selected or unselected based on
/// that state.
/// It
class ButtonCircleState extends StatelessWidget {
  const ButtonCircleState({
    Key? key,
    required this.listenable,
    required this.onPressed,
    required this.selectionFunction,
    required this.pictureAsset,
    this.logoWidth = 18,
    this.logoHeight = 18,
    this.color = AppColors.primaryW25,
    this.selectedColor = AppColors.primary,
    this.borderColor = AppColors.primaryW100,
    this.iconColor = AppColors.primary,
    this.iconSelectedColor = AppColors.primaryW25,
  }) : super(key: key);

  /// [listenable] the [ValueNotifier] the button observes to rebuild it self when
  /// changed.
  final ValueNotifier listenable;

  /// [onPressed] the function to be executed when this button is pressed.
  /// can be used to change the value the button is observing.
  final Function() onPressed;

  /// [selectionFunction] the functions that decides whether this button is selected
  /// or not. if it evaluates to true, the button will be set to the selected state,
  /// otherwise the button will be appear unselected.
  final SelectionFunction selectionFunction;

  /// [pictureAsset] is the icon to be displayed on the button.
  final String pictureAsset;

  /// [logoWidth] the desired width for the icon.
  final double logoWidth;

  /// [logoWidth] the desired height for the icon.
  final double logoHeight;

  /// [color] the color of the button in the unselected state.
  final Color color;

  /// [selectedColor] the color of the button in the selected state.
  final Color selectedColor;

  /// [borderColor] the color of the border drawn aroung the button in
  /// the selected state.
  final Color borderColor;

  /// [iconColor] the color of the icon in the unselected state.
  final Color iconColor;

  /// [iconSelectedColor] the color of the icon in the selected state.
  final Color iconSelectedColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: MaterialButton(
        elevation: 0,
        shape: CircleBorder(
          side: selectionFunction()
              ? BorderSide(
                  width: 3,
                  color: borderColor,
                  style: BorderStyle.solid,
                )
              : BorderSide.none,
        ),
        color: selectionFunction() ? selectedColor : color,
        textColor: AppColors.primary,
        onPressed: onPressed,
        child: SvgPicture.asset(
          pictureAsset,
          width: logoWidth,
          height: logoHeight,
          color: selectionFunction() ? iconSelectedColor : iconColor,
          semanticsLabel: 'grid view icon',
        ),
      ),
    );
  }
}
