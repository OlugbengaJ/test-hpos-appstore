import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/home_screen/homes_screen.dart';
import 'package:hpos_appstore/screens/screen_config.dart';

/// [NavigationProvider] handles navigation between screens
/// while notifying other components of a change in route.
class NavigationProvider extends ChangeNotifier {
  final selectedPane = ValueNotifier(HomeScreen.screenConfig);
  ScreenConfig get _currentRoute => selectedPane.value;
  set _currentRoute(ScreenConfig config) => selectedPane.value = config;

  /// Notifies a change to the header visibility.
  final headerVisibility = ValueNotifier(true);
  bool get _headerVisible => headerVisibility.value;
  set _headerVisible(bool visible) => headerVisibility.value = visible;

  /// Notifies a change to the header's search visibility.
  final searchVisibility = ValueNotifier(true);
  bool get _searchVisible => searchVisibility.value;
  set _searchVisible(bool visible) => searchVisibility.value = visible;

  /// Notifies a change to the header's profile visibility
  final profileVisibility = ValueNotifier(true);
  bool get _profileVisible => profileVisibility.value;
  set _profileVisible(bool visible) => profileVisibility.value = visible;

  /// Notifies a change to the header's home greeting section.
  final childVisibility = ValueNotifier<Widget?>(null);
  set _childVisible(Widget? widget) => childVisibility.value = widget;

  void navigateTo(ScreenConfig route) {
    // set header values first
    _setHeader(route);

    // then route to page
    _currentRoute = route;
  }

  void _setHeader(ScreenConfig newRoute) {
    final showHeader = newRoute.showHeader;
    final showSearch = newRoute.showSearch;
    final showProfile = newRoute.showProfile;
    final child = newRoute.child;

    // set visibilty of header components based on the screen.
    if (showHeader != null && showHeader != _headerVisible) {
      _headerVisible = showHeader;
    } else if (!_headerVisible) {
      _headerVisible = true;
    }

    if (showSearch != null && showSearch != _searchVisible) {
      _searchVisible = showSearch;
    } else if (!_searchVisible) {
      _searchVisible = true;
    }

    if (showProfile != null && showProfile != _profileVisible) {
      _profileVisible = showProfile;
    } else if (!_profileVisible) {
      _profileVisible = true;
    }

    if (_currentRoute != newRoute) {
      // route has changed
      _childVisible = child;
    }
  }
}
