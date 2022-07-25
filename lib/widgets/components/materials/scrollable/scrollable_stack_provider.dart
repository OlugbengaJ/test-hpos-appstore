import 'package:flutter/material.dart';

class ScrollableStackProvider extends ChangeNotifier {
  ScrollableStackProvider(this.controller);

  late ScrollController controller;

  final prefixVisibleNotifier = ValueNotifier(false);
  final suffixVisibleNotifier = ValueNotifier(true);

  set _suffixVisible(bool value) => suffixVisibleNotifier.value = value;
  set _prefixVisible(bool value) => prefixVisibleNotifier.value = value;

  void scroll(AxisDirection axisDirection) {
    double offset = controller.offset;
    double width = 200;

    switch (axisDirection) {
      case AxisDirection.down:
      case AxisDirection.right:
        offset += width;
        break;
      default:
        offset -= width;
    }

    debugPrint('pixel: ${controller.position.pixels}');
    debugPrint('pixel: ${controller.position.viewportDimension}');

    controller
        .animateTo(
          offset,
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        )
        .then((value) => _setIconsVisibility(axisDirection));
  }

  void _setIconsVisibility(AxisDirection axisDirection) {
    switch (axisDirection) {
      case AxisDirection.down:
      case AxisDirection.right:
        if (controller.offset == controller.position.maxScrollExtent) {
          _suffixVisible = false;
        }
        if (!prefixVisibleNotifier.value &&
            controller.offset != controller.position.minScrollExtent) {
          _prefixVisible = true;
        }
        break;
      default:
        if (controller.offset == controller.position.minScrollExtent) {
          _prefixVisible = false;
        }
        if (!suffixVisibleNotifier.value &&
            controller.offset != controller.position.maxScrollExtent) {
          _suffixVisible = true;
        }
        break;
    }
  }
}
