import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/texts/search_bar_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.textController,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController textController;
  final String? hintText;
  final String? labelText;

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
    final provider = Provider.of<SearchBarProvider>(context);

    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon ?? _getPrefixIcon(),
        suffixIcon: ValueListenableBuilder<String>(
          valueListenable: provider.textNotifier,
          builder: (_, value, __) {
            if (value.isEmpty) return const SizedBox();
            return _getSuffixIcon(provider);
          },
        ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onChanged: (value) {
        provider.text = value;
      },
      onSubmitted: (value) {
        provider.search();
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

  Widget _getPrefixIcon([SearchBarProvider? provider]) {
    return prefixIcon ??
        _getIconButton(
          Icons.search,
          () => provider?.search(),
        );
  }

  Widget _getSuffixIcon([SearchBarProvider? provider]) {
    return suffixIcon ??
        _getIconButton(
          Icons.close,
          () {
            textController.clear();
            provider?.clear();
          },
        );
  }
}
