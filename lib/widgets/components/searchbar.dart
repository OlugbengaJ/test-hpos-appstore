import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/numericals.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    Key? key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textController,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final TextEditingController? textController;

  /// An icon that appears before the [prefix] or [prefixText] and before
  /// the editable part of the text field, within the decoration's container.
  ///
  /// Refer to the docs on [TextField] prefixIcon.
  final Widget? prefixIcon;

  /// An icon that appears after the editable part of the text field and after
  /// the [suffix] or [suffixText], within the decoration's container.
  ///
  /// Refer to the docs on [TextField] suffixIcon.
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Numericals.double16)),
        ),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon ?? const Icon(Icons.search),
        suffixIcon: getSuffixIcon(),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
    );
  }

  Widget? getSuffixIcon() {
    if (textController == null || textController!.text.isEmpty) {
      return suffixIcon;
    }

    return IconButton(
      onPressed: () => textController?.clear(),
      icon: const Icon(Icons.close),
    );
  }
}
