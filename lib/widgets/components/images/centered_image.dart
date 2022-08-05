import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/images/image_loader.dart';

class CenteredImage extends StatelessWidget {
  const CenteredImage({
    Key? key,
    required this.logo,
    this.width = 62.13,
    this.height = 58.0,
    this.semanticLabel,
  }) : super(key: key);

  final String logo;
  final double width;
  final double height;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ImageLoader(
        logo,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        fit: BoxFit.contain,
      ),
    );
  }
}
