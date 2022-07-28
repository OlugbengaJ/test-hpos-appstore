import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/comparer.dart';

class ScreenConfig extends Comparer {
  const ScreenConfig(
    this.route, {
    this.child,
    this.showHeader,
    this.showSearch,
    this.showProfile,
  }) : super(route);

  /// Replacement for the default greeting section of the header.
  /// A widget is required here e.g. [IconButton], [Row], or [Text].
  final Widget? child;

  final String route;

  final bool? showHeader;

  /// Show/hide the search button on the header when [headerVisibility] is true.
  final bool? showSearch;

  /// Show/hide the notification and profile avatar on the header
  /// when [headerVisibility] is true.
  final bool? showProfile;
}
