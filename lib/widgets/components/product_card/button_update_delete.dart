import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';

class ButtonUpdateDelete extends StatelessWidget {
  const ButtonUpdateDelete(
      {Key? key, this.onUpdate, this.onDelete, this.hasUpdate = false})
      : super(key: key);

  /// [hasUpdate] is the callback handler of the update button.
  ///
  /// If false, the button is set as disabled.
  final bool? hasUpdate;

  /// [onUpdate] is the callback handler of the update button.
  final VoidCallback? onUpdate;

  /// [onDelete] is the callback handler of the delete button.
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Wrap(
        children: [
          SizedBox(
            height: 35.0,
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: AppColors.primaryW500,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Numericals.double8)),
                ),
              ),
              onPressed: () => {},
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    AppTexts.installed,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
          SizedBox(
            height: 35.0,
            width: 130,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 1.0,
                  color: AppColors.red,
                ),
                elevation: 0.0,
                primary: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Numericals.double8)),
                ),
              ),
              onPressed: () => {},
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    children: [
                      const Text(
                        AppTexts.uninstall,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.red,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 10)),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
