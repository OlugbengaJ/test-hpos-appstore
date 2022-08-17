import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/navigation_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/widgets/layouts/header_layout.dart';
import 'package:hpos_appstore/widgets/layouts/sidebar_layout.dart';
import 'package:provider/provider.dart';

class AppLayout extends StatelessWidget {
  const AppLayout(
      {Key? key, required this.content, this.header = const HeaderLayout()})
      : super(key: key);
  final Widget content;
  final Widget header;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryW500,
      body: Row(
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
              margin: const EdgeInsets.only(top: Numericals.double16),
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Numericals.double40),
                ),
              ),
              child: Column(
                children: [
                  // header section containing search, profile, etc.
                  header,
                  Expanded(
                    child: SingleChildScrollView(
                      controller: provider.scrollController,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              // content section
                              child: content,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
