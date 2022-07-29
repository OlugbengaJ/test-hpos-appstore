import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hpos_appstore/utils/utils_import.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_rect.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/texts/textfield_box.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      margin: EdgeInsets.zero,
      constraints: BoxConstraints(
        maxWidth: size.width * 0.4,
        maxHeight: size.height * 0.8,
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(Numericals.double16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Review Microsoft Teams',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: themeData.textTheme.headline6,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 10,
                            bottom: 10,
                          ),
                          child: ButtonRound(
                            icon: Icons.close,
                            iconColor: themeData.primaryColor,
                            size: 36.0,
                            iconSize: 24.0,
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 29,
                      right: 10,
                    ),
                    child: RatingBar.builder(
                      initialRating: 5,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemSize: getVerticalSize(
                        40.00,
                      ),
                      itemCount: 5,
                      updateOnDrag: true,
                      onRatingUpdate: (rating) {},
                      itemBuilder: (context, _) {
                        return const Icon(Icons.star_border,
                            color: AppColors.primary);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(AppTexts.reviewTitle,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: themeData.textTheme.labelMedium),
                  ),
                  TextFieldBox(
                    textController: TextEditingController(),
                    hintText: AppTexts.reviewTitleHint,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(AppTexts.reviewDescription,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: themeData.textTheme.labelMedium),
                  ),
                  TextFieldBox(
                    textController: TextEditingController(),
                    hintText: AppTexts.reviewDescriptionHint,
                    maxLines: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppTexts.reviewTerms,
                            style: themeData.textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: ' ${AppTexts.termsOfSale}',
                            style: themeData.textTheme.bodySmall
                                ?.copyWith(color: ColorConstant.indigo500),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: ButtonRect(
                          tapHandler: () => Navigator.pop(context),
                          color: AppColors.primary,
                          radius: BorderRadius.circular(8.0),
                          child: const Text(
                            AppTexts.submit,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      // creates a space between buttons
                      const SizedBox(width: 8.0),

                      // cancel button
                      Flexible(
                        fit: FlexFit.tight,
                        child: ButtonRect(
                          tapHandler: () => Navigator.pop(context),
                          radius: BorderRadius.circular(8.0),
                          child: const Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: getHorizontalSize(width ?? 0),
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.bluegray300,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Euclid Circular B',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.bluegray100,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setFilled() {
    switch (variant) {
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          all: 10,
        );
    }
  }
}

enum TextFormFieldShape {
  roundedBorder8,
}

enum TextFormFieldPadding {
  paddingAll10,
}

enum TextFormFieldVariant {
  outlineBluegray100,
}

enum TextFormFieldFontStyle {
  euclidCircularBRegular14,
}

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Text(
          text ?? '',
          textAlign: TextAlign.center,
          style: _setFontStyle(),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          all: 12,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.outlineIndigoA400:
        return null;
      default:
        return ColorConstant.indigoA400;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.outlineIndigoA400:
        return Border.all(
          color: ColorConstant.indigoA400,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.fillIndigoA400:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.euclidCircularBSemiBold18IndigoA400:
        return TextStyle(
          color: ColorConstant.indigoA400,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Euclid Circular B',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Euclid Circular B',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum ButtonShape {
  square,
  roundedBorder8,
}

enum ButtonPadding {
  PaddingAll12,
}

enum ButtonVariant {
  fillIndigoA400,
  outlineIndigoA400,
}

enum ButtonFontStyle {
  euclidCircularBSemiBold18,
  euclidCircularBSemiBold18IndigoA400,
}

class ColorConstant {
  static Color bluegray900 = fromHex('#1d2838');

  static Color bluegray800 = fromHex('#344053');

  static Color gray9000c = fromHex('#0c101828');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color bluegray300 = fromHex('#98a1b2');

  static Color indigoA400 = fromHex('#4758f6');

  static Color bluegray100 = fromHex('#cfd4dc');

  static Color indigo900 = fromHex('#161c58');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigo500 = fromHex('#3947c8');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

Size size = WidgetsBinding.instance.window.physicalSize; // * 0.5;
// WidgetsBinding.instance.window.devicePixelRatio;

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return px * (size.width / 520);
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  num statusBar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top;
  num screenHeight = size.height - statusBar;
  return px * (screenHeight / 611);
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

///This method is used to set padding responsively
EdgeInsetsGeometry getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}

///This method is used to set margin responsively
EdgeInsetsGeometry getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }
  return EdgeInsets.only(
    left: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}

class ImageConstant {
  static String imgArrowright = 'assets/icons/arrow_forward.svg';

  static String imageNotFound = 'assets/images/image_not_found.png';
}

class AppStyle {
  static TextStyle txtEuclidCircularBRegular14 = TextStyle(
    color: ColorConstant.bluegray300,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Euclid Circular B',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtEuclidCircularBMedium14 = TextStyle(
    color: ColorConstant.bluegray800,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Euclid Circular B',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtEuclidCircularBSemiBold24 = TextStyle(
    color: ColorConstant.indigo900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Euclid Circular B',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtRobotoRegular16 = TextStyle(
    color: ColorConstant.bluegray400,
    fontSize: getFontSize(
      16,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtEuclidCircularBRegular12 = TextStyle(
    color: ColorConstant.bluegray900,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Euclid Circular B',
    fontWeight: FontWeight.w400,
  );
}

class AppDecoration {
  static BoxDecoration get outlineBluegray100 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.bluegray100,
          width: getHorizontalSize(
            1.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.gray9000c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8.00,
    ),
  );
}

class CommonImageView extends StatelessWidget {
  ///[url] is required parameter for fetching network image
  String? url;
  String? imagePath;
  String? svgPath;
  File? file;
  double? height;
  double? width;
  final BoxFit fit;
  final String placeHolder;

  ///a [CommonNetworkImageView] it can be used for showing any network images
  /// it will shows the placeholder image if image is not found on network
  CommonImageView({
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return _buildImageView();
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return Container(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        placeholder: (context, url) => Container(
          height: 30,
          width: 30,
          child: LinearProgressIndicator(
            color: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit,
      );
    }
    return SizedBox();
  }
}
