import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/layouts/header_layout.dart';
import 'package:hpos_appstore/widgets/layouts/sidebar_layout.dart';

class AppLayout extends StatelessWidget {
  final Widget right;

  const AppLayout(this.right, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryW500,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 111,
              child: Container(
                color: AppColors.primary,
                child: const SidebarLayout(),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const HeaderLayout(),
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
      ),
    );
  }
}
