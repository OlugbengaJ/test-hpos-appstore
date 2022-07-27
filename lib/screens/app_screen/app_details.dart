import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/app_review_card.dart';
import 'package:hpos_appstore/widgets/components/app_screenshot.dart';
import 'package:hpos_appstore/widgets/components/ratings_bar.dart';
import 'package:hpos_appstore/widgets/components/suggestion_tag.dart';
import 'package:hpos_appstore/widgets/components/system_requirement_card.dart';

class AppDetailsView extends StatelessWidget {
  const AppDetailsView({Key? key}) : super(key: key);

  static String route = '/app_details';

  @override
  Widget build(BuildContext context) {

    var productivityApps = [
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Microsoft Teams',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
          'Google Meet',
          'Productivity',
          '48.99',
          3.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Zoom',
          'Productivity',
          'Free',
          3.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
          'Google Suite',
          'Productivity',
          'Free',
          5.0,
          70)
    ];

    var suggestedProd =
        SuggestedApps(AppTexts.suggestedProductivity, productivityApps);

    return Container(
      margin: EdgeInsets.only(top:100),
      child: Column(
        children: [

          // App Icon and summary
          Container(
            margin: EdgeInsets.only(bottom:64),
            child: Row(
              children: [
                Container(
                  height: 184,
                  width: 184,
                  decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff101828), Color(0xff344054), Color(0xff1d2939)],
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
                            Container(
                              height: 50,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Microsoft Teams",
                                        style: TextStyle(
                                          color: Color(0xff101828),
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
                                        color: Color(0xffEDEEFE),
                                        borderRadius: BorderRadius.circular(16)                                      
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Free",
                                          style: TextStyle(
                                            color: Color(0xff3947C9),
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Container(
                                      child: Text("Productivity"),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.circle,
                                        size: 5,
                                      ),
                                    ),
                                    Container(
                                      child: Text("App"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 600,
                              child: Text("Make amazing things happen together at home, work and school by connecting and collaborating with anyone from anywhere."),
                            ),
                          ],
                        ),

                        Container(
                          child: Row(
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff4758F6),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  height: 48,
                                  width: 187,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Install",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18
                                          ),
                                        ),
                                      ),
                                      ImageIcon(
                                        AssetImage("assets/icons/install.png"),
                                        color: Color(0xffffffff),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              InkWell(
                                child: ImageIcon(
                                  AssetImage("assets/icons/share_icon.png"),
                                  color: Color(0xff6C79F8),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.only(bottom: 72),
            height: 132,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff101828), Color(0xff344054), Color(0xff1d2939)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Ratings",
                        style: TextStyle(
                          color: Color(0xff667085)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          color: Color(0xffF2F4F7)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Average",
                        style: TextStyle(
                          color: Color(0xffD0D5DD)
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Color(0xff475467),
                  width: 2,
                  thickness: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Ratings",
                        style: TextStyle(
                          color: Color(0xff667085)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          color: Color(0xffF2F4F7)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Average",
                        style: TextStyle(
                          color: Color(0xffD0D5DD)
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Color(0xff475467),
                  width: 2,
                  thickness: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Ratings",
                        style: TextStyle(
                          color: Color(0xff667085)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          color: Color(0xffF2F4F7)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Average",
                        style: TextStyle(
                          color: Color(0xffD0D5DD)
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Color(0xff475467),
                  width: 2,
                  thickness: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Ratings",
                        style: TextStyle(
                          color: Color(0xff667085)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          color: Color(0xffF2F4F7)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Average",
                        style: TextStyle(
                          color: Color(0xffD0D5DD)
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Color(0xff475467),
                  width: 2,
                  thickness: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Ratings",
                        style: TextStyle(
                          color: Color(0xff667085)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          color: Color(0xffF2F4F7)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Average",
                        style: TextStyle(
                          color: Color(0xffD0D5DD)
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Color(0xff475467),
                  width: 2,
                  thickness: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Ratings",
                        style: TextStyle(
                          color: Color(0xff667085)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "4.5",
                        style: TextStyle(
                          color: Color(0xffF2F4F7)
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Average",
                        style: TextStyle(
                          color: Color(0xffD0D5DD)
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // App screenshots
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 72),
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "App screenshots",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24
                          ),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.primaryW600,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: const Text(
                              AppTexts.seeAll,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryW600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 403,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                AppScreenShot(
                                  image: "assets/images/screenshot_1.png",
                                ),
                                SizedBox(width: 17,),
                                AppScreenShot(
                                  image: "assets/images/screenshot_2.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 403,
                          alignment: Alignment.centerRight,
                          child: const ArrowForwardWidget(),
                        ),
                      ],
                    ),
                  ),
                ),

                
              ],
            ),
          ),

          // Ratings and reviews
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ratings and Reviews",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24
                        ),
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.primaryW600,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: const Text(
                            AppTexts.seeAll,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryW600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 184,
                      width: 184,
                      decoration:  BoxDecoration(
                        color: const Color(0xff3947C9),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: const Text(
                              "4.5",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 72,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          Container(
                            child: const Text(
                              "25 Ratings",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    

                    Container(
                      margin: const EdgeInsets.only(left: 56),
                      height: 184,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          RatingsBar(
                            star: 5,
                            percent: 0.5,
                          ),
                          RatingsBar(
                            star: 4,
                            percent: 0.9,
                          ),
                          RatingsBar(
                            star: 3,
                            percent: 0.2,
                          ),
                          RatingsBar(
                            star: 2,
                            percent: 0.4,
                          ),
                          RatingsBar(
                            star: 1,
                            percent: 0.1,
                          ),
                        
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 56),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 403,
                    child: Stack(
                      children: [
                        Container(
                          height: 299,
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                AppReviewCard(
                                  title: "This app is trash",
                                  content: "Et proin in pellentesque suspendisse nibh lectus mattis ultrices. Lorem arcu pulvinar magna donec posuere massa. Facilisi dapibus mus consectetur ipsum. Odio ut at quam pellentesque faucibus in.",
                                  username: "Draqaris001",
                                  date: "14/07/2021",
                                  likes: 25,
                                  dislikes: 0,
                                  stars: 1,
                                ),
                                SizedBox(width: 17,),

                                AppReviewCard(
                                  title: "Best app in the world",
                                  content: "Et proin in pellentesque suspendisse nibh lectus mattis ultrices. Lorem arcu pulvinar magna donec posuere massa. Facilisi dapibus mus consectetur ipsum. Odio ut at quam pellentesque faucibus in.",
                                  username: "Draqaris001",
                                  date: "14/07/2021",
                                  likes: 23,
                                  dislikes: 0,
                                  stars: 1,
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 299,
                          alignment: Alignment.centerRight,
                          child: const ArrowForwardWidget(),
                        ),
                      ],
                    ),
                  ),
                ),                
              ],
            ),
          ),


          // System requirements

          Container(
             margin: EdgeInsets.only(top: 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Text(
                    "System requirements",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24
                    ),
                  ),
                ),

                SystemRequirementCard(),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.only(top: 72),
            //height: 150,
            child:SuggestionTag(
              tag: "Similar App Suggestions",
              apps: suggestedProd.apps,
              cardType: 'vertical',
            ),
          ),
        ],
      ),
    );


    
  }
}
