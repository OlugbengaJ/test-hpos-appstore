import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';

class OtherInformationsCard extends StatefulWidget {
  OtherInformationsCard({Key? key}) : super(key: key);

  @override
  State<OtherInformationsCard> createState() => _OtherInformationsCardState();
}

class _OtherInformationsCardState extends State<OtherInformationsCard> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: AppColors.greyW25,
      borderRadius: BorderRadius.circular(16),
      elevation: 0.5,
      child: Container(
        height: 276,
        padding: EdgeInsets.only(left: 35, top: 43),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 58),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.provider, 
                      child: const SizedBox(
                        child: Text(
                          "Microsoft inc.",
                          style: TextStyle(
                            color: AppColors.primaryW500,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.size, 
                      child: const SizedBox(
                        child: Text(
                          "234.78 MB",
                          style: TextStyle(
                            color: AppColors.greyW700,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.category, 
                      child: const SizedBox(
                        child: Text(
                          "Collaboration",
                          style: TextStyle(
                            color: AppColors.greyW700,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.latestVersion, 
                      child: const SizedBox(
                        child: Text(
                          "12.564",
                          style: TextStyle(
                            color: AppColors.greyW700,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,                
                children: [
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.releasedDate, 
                      child: const SizedBox(
                        child: Text(
                          "22/07/2004",
                          style: TextStyle(
                            color: AppColors.greyW700,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.languages, 
                      child: const SizedBox(
                        child: Text(
                          "English +10 more",
                          style: TextStyle(
                            color: AppColors.greyW700,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.otherItem, 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: const Text(
                              "Privacy policy",
                              style: TextStyle(
                                color: AppColors.primaryW500,
                                fontWeight: FontWeight.w600,
                                fontSize: 20
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: const Text(
                              "Terms of service",
                              style: TextStyle(
                                color: AppColors.primaryW500,
                                fontWeight: FontWeight.w600,
                                fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Container(),
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


class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.title,
    required this.child
  }) : super(key: key);
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.greyW400,
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            ),
          ),
          Container(            
            child: child,
          )
        ],
      ),
    );
  }
}