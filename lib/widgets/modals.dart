import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/providers/app_provider/app_provider.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';


Future<void> uninstallAppDialog(BuildContext context, AppProvider appProvider) async {
  
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: Container(
            width: 520,
            padding: EdgeInsets.all(Numericals.double40),
            child: ListBody(
              children:  <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text(
                      AppTexts.uninstallApp,
                      style: TextStyle(
                        color: AppColors.primaryW900,
                        fontWeight: FontWeight.w600,
                        fontSize: 24
                      ),
                    ),

                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        child: SvgPicture.asset(
                          AppAssets.closeSVG,
                          color: AppColors.primaryW500,
                        ),
                      ),
                    ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    AppTexts.sureUninstallQuestion,
                    style: TextStyle(
                      color: AppColors.greyW600,
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                    ),
                  ),
                ),
                
                Container(
                  margin: EdgeInsets.only(top: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          appProvider.uninstall();
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryW500,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          height: 48,
                          width: 274,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                child: Text(
                                  AppTexts.yesUninstall,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18
                                  ),
                                ),
                              ),
                                                            
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryW500),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          height: 48,
                          width: 134,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                child: Text(
                                  AppTexts.cancel,
                                  style: TextStyle(
                                    color: AppColors.primaryW500,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        
      );
    },
  );
}