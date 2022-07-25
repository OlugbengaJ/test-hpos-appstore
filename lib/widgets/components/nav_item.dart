import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/navigation_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:provider/provider.dart';


class NavItem extends StatelessWidget {
  const NavItem({Key? key, required this.route, required this.asset})
      : super(key: key);

  final String route;
  final String asset;

  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);

    bool isSelected(pane) => pane == route;

    return ValueListenableBuilder<String>(
      valueListenable: navigationProvider.selectedPane,
      builder: (context, selectedPane, child) {
        return InkWell(
          onTap: () => navigationProvider.navigateTo(route),
          child: SizedBox(
            width: 48.0,
            height: 48.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isSelected(selectedPane) ? AppColors.primaryW600 : null,
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
                  if (isSelected(selectedPane))
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: NavItemBlur(),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

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
