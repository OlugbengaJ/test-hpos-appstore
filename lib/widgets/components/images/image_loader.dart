import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader(
    this.src, {
    Key? key,
    this.width,
    this.height,
    this.semanticLabel,
    this.fit,
    this.progressIndicator,
    this.progressIndicatorPadding,
  }) : super(key: key);

  final String src;
  final double? width;
  final double? height;
  final String? semanticLabel;
  final BoxFit? fit;
  final ProgressIndicator? progressIndicator;
  final double? progressIndicatorPadding;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    // src must end with a file extensions which are usually
    // 3 or 4 characters long e.g. .svg, .png, .jpeg, .webp etc.
    final RegExp exp = RegExp(r'\.[a-z]{3,4}$');
    final lowerSrc = src.toLowerCase();

    // check if a match is found
    final extension = exp.allMatches(lowerSrc);

    // no file extension
    if (extension.isEmpty) return _brokenImage(themeData);

    if (extension.last[0]!.toLowerCase() == '.svg') {
      // load SVG
      return SvgPicture.network(
        src,
        width: width,
        height: height,
        semanticsLabel: semanticLabel,
        fit: BoxFit.contain,
        placeholderBuilder: (BuildContext context) => _progress(),
      );
    }

    // load non-SVG files
    return Image.network(
      src,
      width: width,
      height: height,
      semanticLabel: semanticLabel,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) => _progress(),
      errorBuilder: (context, error, stackTrace) => _brokenImage(themeData),
    );
  }

  Widget _progress() {
    return Container(
      padding: EdgeInsets.all(progressIndicatorPadding ?? 30.0),
      child: progressIndicator ?? const CircularProgressIndicator(),
    );
  }

  Widget _brokenImage(ThemeData themeData) => Icon(
        Icons.broken_image,
        size: width,
        color: themeData.primaryColor,
      );
}
