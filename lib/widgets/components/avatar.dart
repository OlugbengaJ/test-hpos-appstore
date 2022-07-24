import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.radius,
  }) : super(key: key);

  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      radius: radius,
      child: Text(_getAvatarText),
    );
  }

  String get _getAvatarText {
    if (title.isEmpty) return title;

    final splits = title.toUpperCase().split(' ');
    if (splits.length == 1) {
      // text has only one word, return first two characters
      return splits[0].characters.take(2).string;
    }

    // text has words, return first characters of first word and last word.
    return '${splits.first.characters.first}${splits.last.characters.first}';
  }
}
