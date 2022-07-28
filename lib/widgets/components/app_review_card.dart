import 'package:flutter/material.dart';
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
          color: AppColors.greyW25,
          borderRadius: BorderRadius.circular(16)
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and username and stars
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:8),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            username,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff98A2B3)
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.circle,
                            size: 5,
                            color: Color(0xff98A2B3)
                          ),
                        ),
                        Container(
                          child: Text(
                            date,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff98A2B3)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: 20,
                    margin: EdgeInsets.only(top: 16, bottom: 25),
                    child: AppRatingsWidget(ratings: 1),
                  )
                ],
              ),
            ),

            // Content

            Container(
              width: 469,
              child: Text(
                content,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff475467)
                ),

              ),
            ),

            Container(
              margin: EdgeInsets.only(top:30),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: ImageIcon(
                            AssetImage("assets/icons/thumbs_up.png")
                          ),
                        ),
                        Container(
                          child: Text(likes.toString()),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: ImageIcon(
                            AssetImage("assets/icons/thumbs_down.png")
                          ),
                        ),
                        Container(
                          child: Text(dislikes.toString()),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: ImageIcon(
                            AssetImage("assets/icons/flag.png")
                          ),
                        ),                      
                      ],
                    ),
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