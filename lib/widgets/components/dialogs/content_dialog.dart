import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/numericals.dart';

class ContentDialog {
  const ContentDialog({Key? key});

  static Future open(BuildContext context, {Widget? content}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: content,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Numericals.double8),
        ),
      ),
    );
  }
}
