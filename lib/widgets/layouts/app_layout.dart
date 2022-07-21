import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/colors.dart';
import 'package:hpos_appstore/widgets/layouts/sidebar_layout.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({
    Key? key,
    this.leftFlex = 1,
    required this.right,
    this.rightFlex = 8,
  }) : super(key: key);
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
        body: Container(
      decoration: const BoxDecoration(
        color: Color(0xff4758F6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              width: 111,
              child: Container(
                  color: AppColors.primary, child: const SidebarLayout())),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 10),
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: AppColors.dark,
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
              ),
            ),
          )
        ],
      ),
    ));
  }
}
