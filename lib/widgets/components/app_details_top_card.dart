import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/providers/app_provider/app_provider.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/modals.dart';
import 'package:provider/provider.dart';

class AppDetailsTopCard extends StatelessWidget {
  const AppDetailsTopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    
    return Container(
      //margin: EdgeInsets.only(bottom:64),
      child: Row(
        children: [          
          Container(
            height: 184,
            width: 184,
            decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientGreyW500,
              stops: [
                0.25, 71, 96
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
            child: Image(
              image: AssetImage("assets/icons/logos_microsoft-teams.png"),
            ),
          ),

          
          Expanded(
            child: Container(
              height: 184,
              margin: EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Row(
                            children: [
                              const SizedBox(
                                child: Text(
                                  "Microsoft Teams",
                                  style: TextStyle(
                                    color: AppColors.greyW900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 45,
                                height: 23,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryW25,
                                  borderRadius: BorderRadius.circular(16)                                      
                                ),
                                child: const Center(
                                  child: Text(
                                    AppTexts.free,
                                    style: TextStyle(
                                      color: AppColors.primaryW600,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: const [
                              SizedBox(
                                child: Text(
                                  "Productivity",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyW400
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.circle,
                                  size: 4,
                                  color: AppColors.greyW400
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  "App",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyW400
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 600,
                        child: const Text(
                          "Make amazing things happen together at home, work and school by connecting and collaborating with anyone from anywhere.",
                          style: TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyW600,
                          ),
                        ),
                      ),
                    ],
                  ),


                  ValueListenableBuilder<bool>(
                    valueListenable: appProvider.installed, 
                    builder: (context, installed, _){
                      return Container(
                        child: Row(
                          children: [
                            (!installed)?
                            Row(
                              children: [
                                InkWell(
                                  onTap: appProvider.install,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryW500,
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    height: 48,
                                    width: 187,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          child: Text(
                                            AppTexts.install,
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: SvgPicture.asset(
                                            AppAssets.installSVG,
                                            color: AppColors.white,
                                          ),
                                        ),                                
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                              ],
                            ):
                            Row(
                              children: [
                                  InkWell(                                
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryW400,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      height: 48,
                                      width: 187,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            child: Text(
                                              AppTexts.installed,
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
                                  const SizedBox(width: 20,),
                                  InkWell(
                                    onTap: (){
                                      uninstallAppDialog(context, appProvider);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.red),
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      height: 48,
                                      width: 134,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            child: Text(
                                              AppTexts.uninstall,
                                              style: TextStyle(
                                                color: AppColors.red,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: SvgPicture.asset(
                                              AppAssets.trashSVG,
                                              color: AppColors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                              ],
                            ),
                            InkWell(
                              child: ImageIcon(
                                AssetImage(
                                  AppAssets.shareIconPng
                                ),
                                color: AppColors.primaryW400,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
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