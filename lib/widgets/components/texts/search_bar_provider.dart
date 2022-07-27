import 'package:flutter/material.dart';

class SearchBarProvider extends ValueNotifier<String> {
  SearchBarProvider(super.value);

  set text(String t) => value = t;

  void clear() => value = '';
}
