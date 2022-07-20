import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/colors.dart';

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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              width: 100,
              child: Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 50.0),
                  color: AppColors.primary,
                  child: widget.left)),
          Expanded(
            child: Column(
              children: [
                AppBar(
                  bottomOpacity: 0.0,
                  elevation: 0.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: widget.rightFlex,
                      child: widget.right,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
