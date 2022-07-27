import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;

class LibraryHeaderView extends StatelessWidget {
  const LibraryHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          toolbarHeight: 50.0,
          backgroundColor: AppColors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    primary: Colors.grey,
                    backgroundColor: Colors.transparent),
                child: Stack(
                    alignment: Alignment.topCenter,
                    fit: StackFit.passthrough,
                    children: [
                      const Positioned(top: 10, child: Text('All Apps')),
                      Container(
                          height: 2,
                          margin: const EdgeInsets.only(top: 40.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.lightBlue,
                              Colors.blue.shade900,
                              Colors.purple
                            ]),
                          ))
                    ]),
                onPressed: () {},
              ),
              TextButton(
                style: TextButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    primary: Colors.grey,
                    backgroundColor: Colors.transparent),
                child: Stack(
                    alignment: Alignment.topCenter,
                    fit: StackFit.passthrough,
                    children: [
                      const Positioned(top: 10, child: Text('Installed Apps')),
                      Container(
                        height: 2,
                        margin: const EdgeInsets.only(top: 40.0),
                      )
                    ]),
                onPressed: () {},
              ),
            ],
          ),
        ),
        app_spacer.Spacer.bottomMedium,
      ],
    );
  }
}
