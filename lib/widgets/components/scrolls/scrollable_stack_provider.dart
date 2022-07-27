import 'package:flutter/material.dart';

class ScrollableStackProvider extends ChangeNotifier {
  ScrollableStackProvider() {
    controller = ScrollController();

    // register a listener
    controller.addListener(_controllerListener);

    // scrolling to zero to hide buttons if necessary.
    scroll(AxisDirection.left, 0);
  }

  late ScrollController controller;
  final prefixVisibleNotifier = ValueNotifier(false);
  final suffixVisibleNotifier = ValueNotifier(true);

  // @override
  // void dispose() {
  //   controller.removeListener(_controllerListener);
  //   super.dispose();
  // }

  /// Attach a listener to the controller.
  void _controllerListener() => _setIconsVisibility();

  /// Change the value of the [suffixVisibleNotifier].
  set _suffixVisible(bool value) => suffixVisibleNotifier.value = value;

  /// Change the value of the [prefixVisibleNotifier].
  set _prefixVisible(bool value) => prefixVisibleNotifier.value = value;

  /// Animates the [controller] position from its current value to the given value.
  void scroll(AxisDirection axisDirection, [double? scrollExtent]) async {
    if (scrollExtent != null) await Future.delayed(const Duration(seconds: 3));

    if (controller.hasClients) {
      double offset = controller.offset;
      double width = scrollExtent ?? 200;

      switch (axisDirection) {
        case AxisDirection.down:
        case AxisDirection.right:
          offset += width;
          break;
        default:
          offset -= width;
      }

      // check that width of stack is less than max scrollable
      debugPrint(
          'pixel: ${controller.position.pixels} \tviewportDimension: ${controller.position.viewportDimension}');

      controller
          .animateTo(
            offset,
            duration: const Duration(seconds: 1),
            curve: Curves.ease,
          )
          .then((value) => _setIconsVisibility());
    }
  }

  /// Shows or hides scroll buttons based on the controller's current position.
  void _setIconsVisibility() {
    if (controller.offset == controller.position.minScrollExtent) {
      _prefixVisible = false;
    }
    if (controller.offset == controller.position.maxScrollExtent) {
      _suffixVisible = false;
    }
    if (controller.offset != controller.position.minScrollExtent) {
      _prefixVisible = true;
    }
    if (controller.offset != controller.position.maxScrollExtent) {
      _suffixVisible = true;
    }
  }
}
