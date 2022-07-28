import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/home_screen/homes_screen.dart';

class NavigationProvider extends ChangeNotifier {
  var selectedPane = ValueNotifier(HomeScreen.route);

  final headerVisibility = ValueNotifier(true);

  final searchVisibility = ValueNotifier(true);

  final backVisibility = ValueNotifier(false);

  final notificationVisibility = ValueNotifier(true);

  final profileVisibility = ValueNotifier(true);

  final childVisibility = ValueNotifier<MapEntry<String, Widget?>>(
      MapEntry(HomeScreen.route, null));

  void navigateTo(
    String route, {

    /// When [headerVisibility] is false, the entire header is removed from the view.
    bool? showHeader,

    /// Show/hide the back button on the header when [headerVisibility] is true.
    bool? showBack,

    /// Show/hide the search button on the header when [headerVisibility] is true.
    bool? showSearch,

    /// Show/hide the notification button on the header when [headerVisibility] is true.
    bool? showNotification,

    /// Show/hide the profile avatar on the header when [headerVisibility] is true.
    bool? showProfile,

    /// Replacement for the default greeting section of the header.
    Widget? greeting,
  }) {
    selectedPane.value = route;

    // set header values
    _setHeader(
      showHeader,
      showBack,
      showSearch,
      showNotification,
      showProfile,
      MapEntry(route, greeting),
    );
  }

  void _setHeader(
    bool? showHeader,
    bool? showBack,
    bool? showSearch,
    bool? showNotification,
    bool? showProfile,
    MapEntry<String, Widget?> greeting,
  ) {
    // set visibilty of header components based on the screen.
    if (showHeader != null && showHeader != headerVisibility.value) {}

    if (showBack != null && showBack != backVisibility.value) {}

    if (showSearch != null && showSearch != searchVisibility.value) {}

    if (showNotification != null &&
        showNotification != notificationVisibility.value) {}

    if (showProfile != null && showProfile != profileVisibility.value) {}

    if (childVisibility.value.key != greeting.key) {
      childVisibility.value = MapEntry(greeting.key, greeting.value);
    }
  }
}
