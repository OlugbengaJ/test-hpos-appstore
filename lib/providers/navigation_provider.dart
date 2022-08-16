import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/screens/home_screen/homes_screen.dart';
import 'package:hpos_appstore/screens/screen_config.dart';

/// [NavigationProvider] handles navigation between screens
/// while notifying other components of a change in route.
class NavigationProvider extends ChangeNotifier {
  NavigationProvider() {
    scrollController = ScrollController();

    // scrolling to top.
    scrollToTop(0);
  }

  late ScrollController scrollController;

  final selectedPane = ValueNotifier(HomeScreen.screenConfig);

  /// Notifies a change to the header visibility.
  final headerVisibility = ValueNotifier(true);

  /// Notifies a change to the header's search visibility.
  final searchVisibility = ValueNotifier(true);

  /// Notifies a change to the header's profile visibility
  final profileVisibility = ValueNotifier(true);

  /// Notifies a change to the header's home greeting section.
  final childVisibility = ValueNotifier<Widget?>(null);

  /// Notifies pages that require a product to show its details with the product changes.
  final ValueNotifier<ProductProvider?> product = ValueNotifier(null);

  void navigateTo(ScreenConfig route, {dynamic data}) {
    // set header values first
    _setHeader(route);

    if (data != null && data is ProductProvider) {
      product.value = data;
    }

    // then route to page
    selectedPane.value = route;
  }

  void _setHeader(ScreenConfig newRoute) {
    final showHeader = newRoute.showHeader;
    final showSearch = newRoute.showSearch;
    final showProfile = newRoute.showProfile;
    final child = newRoute.child;

    // set visibility of header components based on the screen.
    if (showHeader != null && showHeader != headerVisibility.value) {
      headerVisibility.value = showHeader;
    } else if (!headerVisibility.value) {
      headerVisibility.value = true;
    }

    if (showSearch != null && showSearch != searchVisibility.value) {
      searchVisibility.value = showSearch;
    } else if (!searchVisibility.value) {
      searchVisibility.value = true;
    }

    if (showProfile != null && showProfile != profileVisibility.value) {
      profileVisibility.value = showProfile;
    } else if (!profileVisibility.value) {
      profileVisibility.value = true;
    }

    if (selectedPane.value != newRoute) {
      // route has changed
      childVisibility.value = child;
    }
  }

  /// Animates the [controller] position from its current value to the given value.
  void scrollToTop([double? scrollExtent]) async {
    if (scrollExtent != null) await Future.delayed(const Duration(seconds: 3));

    if (scrollController.hasClients) {
      scrollController
          .animateTo(
            0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.ease,
          )
          .then((value) => value);
    }
  }
}
