import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';

class SystemRequirementCard extends StatefulWidget {
  const SystemRequirementCard({Key? key}) : super(key: key);

  @override
  State<SystemRequirementCard> createState() => _SystemRequirementCardState();
}

class _SystemRequirementCardState extends State<SystemRequirementCard> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: AppColors.greyW25,
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      child: Container(
        height: 76,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 36.33),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.check_circle,
                      color: AppColors.green,
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 26.33),
                    child: Text(
                      "This application should work on your device. Items with a tick meets the developer’s system requirments",
                      style: TextStyle(
                        color: AppColors.primaryW900,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: 19),
              height: 40,
              width: 137,
              decoration: BoxDecoration(
                color: AppColors.primaryW25,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [              
                  Container(
                    child: Text(
                      "Show more",
                      style: TextStyle(
                        color: AppColors.primaryW600,
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                      ),
                    ),
                  ),
                  Container(
                    child: ImageIcon(
                      AssetImage("assets/icons/chevron-down.png")
                    )
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