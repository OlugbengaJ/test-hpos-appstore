import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/navigation_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:provider/provider.dart';

/// [NavItem] simply represents navigation items on the sidebar menu.
/// It also applies proper styling if the [NavItem] is selected.
/// Selected status is gotten from the [NavigationProvider].
class NavItem extends StatelessWidget {
  const NavItem({Key? key, required this.route, required this.asset})
      : super(key: key);

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
        bool isSelected = selectedPane == route;
        const indicatorRadius = Radius.circular(8.0);

        return InkWell(
          onTap: () => navigationProvider.navigateTo(route),
          child: Row(
            children: [
              SizedBox(
                width: 3.0,
                height: 48.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : null,
                    borderRadius: const BorderRadius.only(
                      topRight: indicatorRadius,
                      bottomRight: indicatorRadius,
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 28.0)),
              SizedBox(
                width: 48.0,
                height: 48.0,
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
              const Padding(padding: EdgeInsets.only(right: 32.0)),
            ],
          ),
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
