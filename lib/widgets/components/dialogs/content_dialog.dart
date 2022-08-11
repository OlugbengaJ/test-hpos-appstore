import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/numericals.dart';

class ContentDialog {
  const ContentDialog({Key? key});

  static Future open(
    BuildContext context, {
    Widget? content,
    Widget? title,
    bool useRootNavigator = true,
  }) {
    return showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (context) => AlertDialog(
        title: title,
        content: content,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Numericals.double8),
        ),
      ),
    );
  }
}
