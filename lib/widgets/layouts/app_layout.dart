import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/colors.dart';
import 'package:hpos_appstore/widgets/layouts/sidebar_layout.dart';

class AppLayout extends StatelessWidget {
  final Widget right;

  const AppLayout(this.right, {Key? key}) : super(key: key);

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
              child:
                  Container(color: AppColors.primary, child: SidebarLayout())),
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
                          child: right,
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
