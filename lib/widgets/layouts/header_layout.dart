import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/navigation_provider.dart';
import 'package:hpos_appstore/utils/greetings.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/avatar.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/texts/search_bar.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;
import 'package:provider/provider.dart';

class HeaderLayout extends StatelessWidget {
  const HeaderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);
    final themeData = Theme.of(context);

    return ValueListenableBuilder<bool>(
      valueListenable: navProvider.headerVisibility,
      builder: (context, showHeader, _) => (showHeader)
          ? Padding(
              padding: EdgeInsets.all(Numericals.double40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // listen for child visibility
                  ValueListenableBuilder<Widget?>(
                    valueListenable: navProvider.childVisibility,
                    builder: (context, childValue, child) => (childValue ==
                            null)
                        ? Flexible(
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(Greetings.now),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: Numericals.double4)),
                                    Transform.scale(
                                      scaleX: -1,
                                      child: Icon(
                                        Icons.waving_hand_rounded,
                                        color: Colors.brown,
                                        size: Numericals.double16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Amaka Obasi',
                                  style: themeData.textTheme.headline5
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : Flexible(fit: FlexFit.tight, child: childValue),
                  ),

                  // listen for search visibility
                  ValueListenableBuilder<bool>(
                    valueListenable: navProvider.searchVisibility,
                    builder: (context, showSearch, _) => (showSearch)
                        ? Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                              margin: EdgeInsets.zero,
                              width: 400.0,
                              height: 48.0,
                              child: SearchBar(
                                textController: TextEditingController(),
                                hintText: AppTexts.search,
                              ),
                            ),
                          )
                        : const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  ),

                  // listen for notification and profile visibility
                  ValueListenableBuilder<bool>(
                    valueListenable: navProvider.profileVisibility,
                    builder: (context, showProfile, _) => (showProfile)
                        ? Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonRound(
                                  icon: Icons.notifications_outlined,
                                  iconColor: themeData.primaryColor,
                                  size: 48.0,
                                  iconSize: 24.0,
                                  onTap: () {},
                                ),
                                app_spacer.Spacer.leftMedium,
                                Container(
                                  margin: EdgeInsets.zero,
                                  width: Numericals.navItemHeight,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: themeData.highlightColor,
                                          width: 3),
                                      borderRadius: BorderRadius.circular(24)),
                                  child: const AppAvatar(title: 'Amaka Obasi'),
                                ),
                              ],
                            ),
                          )
                        : const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
