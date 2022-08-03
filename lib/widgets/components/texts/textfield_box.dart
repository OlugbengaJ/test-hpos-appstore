import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/texts/search_bar_provider.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({
    Key? key,
    required this.textController,
    this.hintText,
    this.labelText,
    this.disableIcons = true,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController textController;
  final String? hintText;
  final String? labelText;

  /// Hides icons from being rendered
  final bool disableIcons;

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

  final int? maxLines;

  /// Called when a user has made a change to the text value.
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final provider = SearchBarProvider();

    return TextField(
      controller: textController,
      decoration: InputDecoration(
        contentPadding: prefixIcon == null ? const EdgeInsets.all(8.0) : null,
        hintText: hintText,
        labelText: labelText,
        prefixIcon: disableIcons ? null : prefixIcon,
        suffixIcon: disableIcons
            ? null
            : ValueListenableBuilder<String>(
                valueListenable: provider.textNotifier,
                builder: (_, value, __) {
                  if (value.isEmpty) return const SizedBox();
                  return _getSuffixIcon(provider);
                },
              ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLines: maxLines,
      onChanged: (value) {
        provider.text = value;

        // invoke callback if provided by the user.
        if (onChanged != null) onChanged!(value);
      },
    );
  }

  Widget _getIconButton(IconData icon, VoidCallback onPressed) {
    return ButtonRound(
      icon: icon,
      iconSize: 24.0,
      onTap: onPressed,
    );
  }

  Widget _getSuffixIcon([SearchBarProvider? provider]) {
    final clearIcon = _getIconButton(
      Icons.close,
      () {
        textController.clear();
        provider?.clear();

        // invoke callback if provided by the user.
        if (onChanged != null) onChanged!(null);
      },
    );

    if (suffixIcon == null) {
      return clearIcon;
    }

    return Row(
      children: [clearIcon, suffixIcon!],
    );
  }
}
