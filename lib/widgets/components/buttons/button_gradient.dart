import 'package:flutter/material.dart';

/// [ButtonGradient] returns an [InkWell] button with gradient colors.
///
/// An example of how to consume this widget is as follows:
///
/// ButtonGradient(
///     radius: 4.0,
///     gradient: LinearGradient(
///       colors: [Colors.blue, Colors.green],
///     ),
///     text: Text(
///       'A gradient button',
///       textAlign: TextAlign.center,
///       style: const TextStyle(color: Colors.white),
///     ),
/// );
///
class ButtonGradient extends StatelessWidget {
  const ButtonGradient({
    Key? key,
    required this.gradient,
    required this.text,
    this.radius = 0,
  }) : super(key: key);

  /// Alows you to define the gradient for the button.
  final Gradient gradient;

  /// Text which is displayed on the button.
  final Text text;

  /// Radius of the button.
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: gradient,
        ),
        child: InkWell(
          onTap: () {},
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: text,
          ),
        ),
      ),
    );
  }
}
