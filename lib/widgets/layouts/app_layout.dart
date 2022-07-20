import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({
    Key? key,
    required this.left,
    this.leftFlex = 1,
    required this.right,
    this.rightFlex = 8,
  }) : super(key: key);
  final Widget left;
  final int leftFlex;
  final Widget right;
  final int rightFlex;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: widget.leftFlex,
                child: widget.left,
              ),
              Expanded(
                flex: widget.rightFlex,
                child: widget.right,
              ),
            ],
          )
        ],
      ),
    );
  }
}
