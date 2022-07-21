import 'package:flutter/material.dart';

class TextGradient extends StatelessWidget {
  const TextGradient({
    Key? key,
    required this.gradient,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    // ShaderMask is used here but this could also be
    // achieve using a custom paint
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: textStyle),
    );
  }
}
