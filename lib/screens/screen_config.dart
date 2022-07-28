import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/comparer.dart';

/// [ScreenConfig] as the name implies, is used to initialize screen properties
/// that would affect what is rendered on that screen.
/// It is used, for example, to define the route of a screen and
/// if certain parts of the header bar should be visible.
class ScreenConfig extends Comparer {
  const ScreenConfig(
    this.route, {
    this.child,
    this.showHeader,
    this.showSearch,
    this.showProfile,
  }) : super(route);

  /// Replacement for the default greeting section of the header.
  /// Any [Widget] is accepted here e.g. [IconButton], [Row], or [Text].
  /// The widget could also contain methods e.g.
  ///
  /// IconButton(onPressed: () => debugPrint('happy'),
  ///     icon: Icon(Icons.arrow_back),);
  final Widget? child;

  /// The screen that would be navigated to.
  final String route;

  /// Explicitly hides the header when set to false.
  final bool? showHeader;

  /// Show/hide the search button on the header when [showHeader] is true.
  final bool? showSearch;

  /// Show/hide the notification and profile avatar on the header
  /// when [showHeader] is true.
  final bool? showProfile;
}
