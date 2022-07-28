import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/navigation_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:provider/provider.dart';

/// [NavItem] simply represents navigation items on the sidebar menu.
/// It also applies proper styling if the [NavItem] is selected.
/// Selected status is gotten from the [NavigationProvider].
class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.route,
    required this.asset,
  }) : super(key: key);

  /// Route to be navigated to
  final String route;

  /// Location to the image asset
  final String asset;

  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);

    return ValueListenableBuilder<String>(
      valueListenable: navigationProvider.selectedPane,
      builder: (context, selectedPane, child) {
        final bool isSelected = selectedPane == route;
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // section higlight bar
            SizedBox(
              width: Numericals.navItemRect,
              height: Numericals.navItemHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                  ),
                ),
              ),
            ),

            // section button
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => navigationProvider.navigateTo(route),
                    child: SizedBox(
                      width: Numericals.navItemHeight,
                      height: Numericals.navItemHeight,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryW600 : null,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: ImageIcon(
                                AssetImage(asset),
                                color: Colors.white,
                              ),
                            ),
                            if (isSelected)
                              const Align(
                                alignment: Alignment.bottomCenter,
                                child: NavItemBlur(),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// [NavItemBlur] is a box with an opacity of 0.2 placed over the [NavItem]
/// at the bottom.
class NavItemBlur extends StatelessWidget {
  const NavItemBlur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius circularRadius = const Radius.circular(6.0);

    return SizedBox(
      width: 48.0,
      height: 21.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            bottomLeft: circularRadius,
            bottomRight: circularRadius,
          ),
        ),
        child: Container(),
      ),
    );
  }
}
