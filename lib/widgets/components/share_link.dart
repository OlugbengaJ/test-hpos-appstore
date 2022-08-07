import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpos_appstore/utils/constraints.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/texts/textfield_box.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareLink extends StatelessWidget {
  const ShareLink({Key? key, required this.link}) : super(key: key);

  final String link;

  @override
  Widget build(BuildContext context) {
    final screenSize = AppConstraint.window.physicalSize;
    final themeData = Theme.of(context);

    return ScaffoldMessenger(
      child: Builder(
        builder: (context) => Container(
          margin: EdgeInsets.zero,
          constraints: BoxConstraints(
            maxWidth: screenSize.width * 0.4,
            maxHeight: screenSize.height * 0.4,
          ),
          width: screenSize.width * 0.2,
          height: screenSize.height * 0.3,
          child: Scaffold(
            body: SizedBox.expand(
              child: Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: screenSize.height),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // row for the available apps
                          TextFieldBox(
                            textController: TextEditingController(text: link),
                            onChanged: null,
                            enabled: false,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40.0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Share with app',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _ShareLinkOption(
                              link: link,
                              text: AppTexts.copyLink,
                              icon: Icons.link,
                              tapHandler: () {
                                Clipboard.setData(ClipboardData(text: link));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: themeData.primaryColor,
                                    content: Text(
                                      '"$link", ${AppTexts.notifyCopyToClipboard}',
                                      textAlign: TextAlign.center,
                                      style: themeData
                                          .snackBarTheme.contentTextStyle
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const Divider(height: 100),
                            _ShareLinkOption(
                              link: link,
                              text: AppTexts.email,
                              icon: Icons.mail,
                              iconSize: 36.0,
                              tapHandler: () {
                                final emailUri = Uri(
                                  scheme: 'mailto',
                                  // path: 'adeleke.adelaja@andela.com',
                                  query: {
                                    'subject': 'hpos App Link',
                                    'body': 'Here is your hpos App Link:'
                                        '\r\n\r\n $link \r\n',
                                  }
                                      .entries
                                      .map((e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                      .join('&'),
                                );
                                launchUrl(emailUri);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShareLinkOption extends StatelessWidget {
  const _ShareLinkOption({
    Key? key,
    required this.link,
    required this.text,
    this.icon,
    this.iconSize,
    this.tapHandler,
  }) : super(key: key);

  final String link;
  final String text;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback? tapHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonRound(
          iconColor: Theme.of(context).primaryColor,
          icon: icon,
          iconSize: iconSize ?? 36,
          size: 48.0,
          onTap: tapHandler,
        ),
        Text(text)
      ],
    );
  }
}
