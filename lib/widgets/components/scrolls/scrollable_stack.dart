import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/scrolls/scrollable_stack_provider.dart';

/// [ScrollableStack] renders a stack with widget children and overlay buttons.
///
/// The buttons are displayed based on the scroll state of the stack,
/// otherwise they are hidden when explicitly disabled.
class ScrollableStack extends StatelessWidget {
  const ScrollableStack({
    Key? key,
    required this.children,
    this.buttonColor,
    this.border,
    this.iconColor,
    this.prefixIcon,
    this.suffixIcon,
    this.size,
    this.scrollDirection = Axis.horizontal,
    this.disableIcons = false,
    this.iconPadding = const EdgeInsets.all(40.0),
    this.useIconGroup = false,
    this.iconGroupAtStart = false,
  }) : super(key: key);

  /// A collection of widgets to be rendered in the stack.
  final List<Widget> children;

  /// Background color of the button.
  final Color? buttonColor;

  /// Border used by the button.
  final BoxBorder? border;

  /// Foreground color of the button's icon.
  final Color? iconColor;

  /// An icon to be displayed on the prefix button.
  final IconData? prefixIcon;

  /// An icon to be displayed on the suffix button.
  final IconData? suffixIcon;

  /// The size of the button
  final double? size;

  /// When [Axis.horizontal] is used, the scroll is horizontal and buttons are
  /// displayed at the left and right if [disableIcons] is false.
  ///
  /// Otherwise, [Axis.vertical], the scroll is vertical and icons are
  /// displayed at the top and buttom if [disableIcons] is false.
  final Axis scrollDirection;

  /// Explicitly prevent the icons from showing.
  final bool disableIcons;

  /// The padding around the icon
  final EdgeInsets iconPadding;

  /// Groups prefix and suffix icons at a specific end.
  final bool useIconGroup;

  /// Displays icons on the left or right if [useIconGroup] is `true`.
  /// Defaults to `false`, so icons appear on the right.
  /// When set to true, icons appear on the left.
  final bool iconGroupAtStart;

  @override
  Widget build(BuildContext context) {
    final provider = ScrollableStackProvider();
    final themeData = Theme.of(context);

    return Stack(
      children: [
        // contents go here.
        SingleChildScrollView(
          controller: provider.controller,
          scrollDirection: scrollDirection,
          child: _getLayout(),
        ),

        // non-grouped icons.
        if (!disableIcons && !useIconGroup) ...[
          // non-grouped left button
          ValueListenableBuilder<bool>(
            valueListenable: provider.prefixVisibleNotifier,
            builder: (_, value, child) {
              // if (value) {
              return Positioned.fill(
                child: Align(
                  alignment: _prefixIconAlignment(),
                  child: _scrollIcon(
                    enabled: value,
                    axisDirection: AxisDirection.left,
                    provider: provider,
                    color: buttonColor ?? themeData.primaryColor,
                    iconColor:
                        iconColor ?? themeData.colorScheme.inversePrimary,
                    icon: prefixIcon ?? Icons.arrow_back,
                    padding: iconPadding,
                  ),
                ),
              );
              // }

              // return const SizedBox();
            },
          ),

          // non-grouped right button
          ValueListenableBuilder<bool>(
            valueListenable: provider.suffixVisibleNotifier,
            builder: (_, value, child) {
              // if (value) {
              return Positioned.fill(
                child: Align(
                  alignment: _suffixIconAlignment(),
                  child: _scrollIcon(
                      enabled: value,
                      axisDirection: AxisDirection.right,
                      provider: provider,
                      color: buttonColor ?? themeData.primaryColor,
                      iconColor:
                          iconColor ?? themeData.colorScheme.inversePrimary,
                      icon: suffixIcon ?? Icons.arrow_forward,
                      padding: iconPadding),
                ),
              );
              // }

              // return const SizedBox();
            },
          ),
        ] else if (!disableIcons && useIconGroup) ...[
          // grouped buttons
          Positioned.fill(
            child: Align(
              alignment: iconGroupAtStart
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: _groupedIconsLayout(_groupedIcons(provider, themeData)),
            ),
          )
        ],
      ],
    );
  }

  List<Widget> _groupedIcons(
    ScrollableStackProvider provider,
    ThemeData themeData,
  ) {
    return [
      ValueListenableBuilder<bool>(
        valueListenable: provider.prefixVisibleNotifier,
        builder: (_, value, child) {
          // if (value) {
          return _scrollIcon(
            enabled: value,
            axisDirection: AxisDirection.left,
            provider: provider,
            color: buttonColor ?? themeData.primaryColor,
            iconColor: iconColor ?? themeData.colorScheme.inversePrimary,
            icon: prefixIcon ?? Icons.arrow_back,
            padding: scrollDirection == Axis.horizontal
                ? const EdgeInsets.only(right: 4.0)
                : const EdgeInsets.only(bottom: 4.0),
          );
          // }

          // return const SizedBox();
        },
      ),
      ValueListenableBuilder<bool>(
        valueListenable: provider.suffixVisibleNotifier,
        builder: (_, value, child) {
          // if (value) {
          return _scrollIcon(
            enabled: value,
            axisDirection: AxisDirection.right,
            provider: provider,
            color: buttonColor ?? themeData.primaryColor,
            iconColor: iconColor ?? themeData.colorScheme.inversePrimary,
            icon: prefixIcon ?? Icons.arrow_forward,
            padding: scrollDirection == Axis.horizontal
                ? const EdgeInsets.only(left: 4.0)
                : const EdgeInsets.only(top: 4.0),
          );
          // }

          // return const SizedBox();
        },
      ),
    ];
  }

  Widget _groupedIconsLayout(List<Widget> children) {
    if (scrollDirection == Axis.horizontal) {
      return Padding(
        padding:
            EdgeInsets.only(right: iconGroupAtStart ? 0 : iconPadding.right),
        child: Row(
          mainAxisAlignment: iconGroupAtStart
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: children,
        ),
      );
    }

    return Padding(
      padding:
          EdgeInsets.only(bottom: iconGroupAtStart ? 0 : iconPadding.bottom),
      child: Column(
        mainAxisAlignment:
            iconGroupAtStart ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: children,
      ),
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

  Widget _scrollIcon({
    required bool enabled,
    required AxisDirection axisDirection,
    required ScrollableStackProvider provider,
    required Color color,
    required Color iconColor,
    required IconData icon,
    required EdgeInsetsGeometry padding,
  }) {
    return Padding(
      padding: padding,
      child: ButtonRound(
        onTap: enabled ? () => provider.scroll(axisDirection) : null,
        color: enabled ? color : color.withAlpha(40),
        border: border,
        size: size ?? 24.0,
        icon: icon,
        iconColor: enabled ? iconColor : iconColor.withAlpha(180),
      ),
    );
  }
}
