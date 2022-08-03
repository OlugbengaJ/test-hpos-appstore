import 'package:flutter/material.dart';

class SearchBarProvider extends ChangeNotifier {
  final textNotifier = ValueNotifier('');
  final searchNotifier = ValueNotifier(false);

  /// Updates the search text value.
  set text(String t) => textNotifier.value = t;

  /// Called when the search button is clicked
  ///
  /// On click of the search button, the value is set to true for 2 seconds
  /// enough to notify listeners then changes back to false.
  void search() {
    searchNotifier.value = true;

    // wait for a few seconds before changing to false
    Future.delayed(const Duration(seconds: 2)).then((v) {
      searchNotifier.value = false;
    });
  }

  /// Clears the search text value.
  void clear() => textNotifier.value = '';
}
