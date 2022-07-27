import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/widgets/layouts/header_layout.dart';
import 'package:hpos_appstore/widgets/layouts/sidebar_layout.dart';

class AppLayout extends StatelessWidget {
  const AppLayout(
      {Key? key, required this.content, this.header = const HeaderLayout()})
      : super(key: key);
  final Widget content;
  final Widget header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                margin: EdgeInsets.only(top: Numericals.double16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Numericals.double40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Numericals.double40),
                    child: Column(
                      children: [
                        header,
                        Row(
                          children: [
                            Expanded(
                              child: content,
                            ),
                          ],
                        ),
                      ],
                    ),
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
