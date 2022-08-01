import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/product_card/rating_edit.dart';

class AppReviewCard extends StatelessWidget {
  const AppReviewCard({
    Key? key,
    required this.title,
    required this.content,
    required this.username,
    required this.date,
    required this.stars,
    required this.likes,
    required this.dislikes,
  }) : super(key: key);

  final String title;
  final String content;
  final String username;
  final String date;
  final double stars;
  final int likes;
  final int dislikes;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 1,
      color: AppColors.greyW25,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 299,
        width: 540,
        padding: const EdgeInsets.all(35),
        decoration: BoxDecoration(
            color: AppColors.greyW25, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and username and stars
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColors.greyW400),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Icon(Icons.circle,
                            size: 5, color: AppColors.greyW400),
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColors.greyW400),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  margin: const EdgeInsets.only(top: 16, bottom: 25),
                  child: const AppRatingsWidget(ratings: 1),
                )
              ],
            ),

            // Content

            SizedBox(
              width: 469,
              child: Text(
                content,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.greyW600),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage(AppAssets.thumbsUpPng),
                          color: AppColors.primaryW500,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            likes.toString(),
                            style: const TextStyle(
                                color: AppColors.greyW700,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage(AppAssets.thumbsDownPng),
                          color: AppColors.primaryW500,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            dislikes.toString(),
                            style: const TextStyle(
                                color: AppColors.greyW700,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(AppAssets.flagPng),
                        color: AppColors.primaryW500,
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
