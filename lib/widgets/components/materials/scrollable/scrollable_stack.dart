import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/materials/button_round.dart';
import 'package:hpos_appstore/widgets/components/materials/scrollable/scrollable_stack_provider.dart';

/// [ScrollableStack] renders a stack with widget children and overlay buttons.
///
/// The buttons are displayed based on the scroll state of the stack,
/// otherwise they are hidden when explicitly disabled.
class ScrollableStack extends StatelessWidget {
  const ScrollableStack({
    Key? key,
    this.scrollDirection = Axis.horizontal,
    this.disableIcons = false,
    required this.children,
    this.buttonColor,
    this.iconColor,
    this.suffixIcon,
    this.size,
  }) : super(key: key);

  /// A collection of widgets to be rendered in the stack.
  final List<Widget> children;

  /// When [Axis.horizontal] is used, the scroll is horizontal and buttons are
  /// displayed at the left and right if [disableIcons] is false.
  ///
  /// Otherwise, [Axis.vertical], the scroll is vertical and icons are
  /// displayed at the top and buttom if [disableIcons] is false.
  final Axis scrollDirection;

  /// Explicitly prevent the icons from showing.
  final bool disableIcons;

  /// Background color of the button.
  final Color? buttonColor;

  /// Foreground color of the button's icon.
  final Color? iconColor;

  /// An icon to be displayed on the button.
  final IconData? suffixIcon;

  /// The size of the button
  final double? size;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final ScrollController controller = ScrollController();
    final provider = ScrollableStackProvider(controller);

    return Stack(
      children: [
        SingleChildScrollView(
          controller: controller,
          scrollDirection: scrollDirection,
          child: _getLayout(),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: provider.prefixVisibleNotifier,
          builder: (_, value, child) {
            if (value) {
              return Positioned.fill(
                child: Align(
                  alignment: _prefixIconAlignment(),
                  child: ButtonRound(
                    onTap: () => provider.scroll(AxisDirection.left),
                    color: buttonColor ?? themeData.primaryColor,
                    size: size ?? 24,
                    icon: suffixIcon ?? Icons.arrow_back,
                    iconColor:
                        iconColor ?? themeData.colorScheme.inversePrimary,
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
        if (!disableIcons)
          ValueListenableBuilder<bool>(
            valueListenable: provider.suffixVisibleNotifier,
            builder: (_, value, child) {
              if (value) {
                return Positioned.fill(
                  child: Align(
                    alignment: _suffixIconAlignment(),
                    child: ButtonRound(
                      onTap: () => provider.scroll(AxisDirection.right),
                      color: buttonColor ?? themeData.primaryColor,
                      size: size ?? 24,
                      icon: suffixIcon ?? Icons.arrow_forward,
                      iconColor:
                          iconColor ?? themeData.colorScheme.inversePrimary,
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
      ],
    );
  }

  Widget _getLayout() {
    if (scrollDirection == Axis.horizontal) {
      return Row(children: children);
    }

    return Column(children: children);
  }

  Alignment _prefixIconAlignment() {
    if (scrollDirection == Axis.horizontal) {
      return Alignment.centerLeft;
    }

    return Alignment.topRight;
  }

  Alignment _suffixIconAlignment() {
    if (scrollDirection == Axis.horizontal) {
      return Alignment.centerRight;
    }

    return Alignment.bottomRight;
  }
}
