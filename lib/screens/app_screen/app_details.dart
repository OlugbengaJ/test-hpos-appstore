import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';

class AppDetailsView extends StatelessWidget {
  const AppDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage("assets/icons/back.png")
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text("Back"),
                )
              ],
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage("assets/icons/bell.png"),
                  color: Color(0xff4758F6),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color:  Color(0xffC8CDFC),
                      shape: BoxShape.circle
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xff3947C9),
                        shape: BoxShape.circle
                      ),
                      child: const Center(
                        child: Text(
                          "AO",
                          style: TextStyle(
                            color: Color(0xffFFFFFF)
                          ),
                        )
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
      content: Container(
        margin: EdgeInsets.only(top:100),
        child: Column(
          children: [
            Container(
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
                                          child: Text("Install"),
                                        ),
                                        ImageIcon(
                                          AssetImage("assets/icons/install.png"),
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
              height: 132,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff101828), Color(0xff344054), Color(0xff1d2939)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              margin: EdgeInsets.only(top:10),
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
            Container(
              margin: EdgeInsets.only(top:10),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("App screenshots"),
                  ),
                  Expanded(
                    child: Container(
                      child: Stack(
                        children: [

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}