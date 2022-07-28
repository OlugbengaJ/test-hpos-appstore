import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.onPointerScroll,
    required this.child,
  }) : super(key: key);

  final void Function(PointerScrollEvent) onPointerScroll;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        if (event is PointerScrollEvent) onPointerScroll(event);
      },
      child: child,
    );
  }
}
