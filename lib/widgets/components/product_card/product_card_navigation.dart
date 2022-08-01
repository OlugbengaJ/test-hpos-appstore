import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/navigation_provider.dart';
import 'package:hpos_appstore/screens/app_screen/app_details.dart';
import 'package:provider/provider.dart';

class ProductCardNavigation extends StatelessWidget {
  const ProductCardNavigation({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);
    return InkWell(
      onTap: () => {
        navigationProvider.navigateTo(AppDetailsView.screenConfig),
      },
      child: child,
    );
  }
}
