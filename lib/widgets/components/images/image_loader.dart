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
      loadingBuilder: (context, child, loadingProgress) {
        if (_isLoading(src, loadingProgress)) return _progress();

        return child;
      },
      errorBuilder: (context, error, stackTrace) => _brokenImage(themeData),
    );
  }

  Widget _progress() {
    return Container(
      padding: EdgeInsets.all(progressIndicatorPadding ?? 30.0),
      child: progressIndicator ?? const CircularProgressIndicator(),
    );
  }

  Widget _brokenImage(ThemeData themeData) {
    return Icon(
      Icons.broken_image,
      size: width,
      color: themeData.primaryColor,
    );
  }
}

/// A place holder to hold image links that are loaded.
final Set<String> _appLinks = {};

/// Identifies an image as loading or complete based on the
/// status of the [loadingProgress]. Returns a [bool].
bool _isLoading(String link, [ImageChunkEvent? loadingProgress]) {
  // check if link exists in the list.
  // first time a link is loaded it does not exist in the list,
  // so we have to show a progress indicator.
  if (!_appLinks.contains(link)){
    _appLinks.add(link);
    return true;
  }

  // bytes are loading over the network, hence show progress indicator.
  if (loadingProgress != null && loadingProgress.cumulativeBytesLoaded > 0) {
    return true;
  }

  // done loading.
  return false;
}
