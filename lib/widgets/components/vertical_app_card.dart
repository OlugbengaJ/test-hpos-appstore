import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/utils/colors.dart';

class VerticalAppCard extends StatelessWidget {
  const VerticalAppCard({Key? key, required this.appData}) : super(key: key);

  final AppModel appData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: SizedBox(
        width: 276.0,
        height: 299.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CardBanner(
                  logo: appData.logo,
                ),
              ),
              CardDetails(
                appData: appData,
              ),
              const InstallButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardBanner extends StatelessWidget {
  const CardBanner({Key? key, required this.logo}) : super(key: key);

  final String logo;

  @override
  Widget build(BuildContext context) {
    Radius circularEdge = const Radius.circular(16.0);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.greyW900,
            const Color(0xff344054),
            const Color(0xff1D2939)
          ],
        ),
        borderRadius:
            BorderRadius.only(topLeft: circularEdge, topRight: circularEdge),
      ),
      child: SizedBox(
        width: 244.0,
        height: 127.0,
        child: Center(
          child: SvgPicture.network(
            logo,
            width: 62.13,
            height: 58.0,
            semanticsLabel: 'App Logo',
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key, required this.appData}) : super(key: key);

  final AppModel appData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    appData.name,
                    style: TextStyle(
                      fontFamily: 'Euclid Circular B',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: AppColors.greyW900,
                    ),
                  ),
                ),
                Text(
                  appData.category,
                  style: TextStyle(
                    fontFamily: 'Euclid Circular B',
                    fontSize: 14.0,
                    color: AppColors.greyW400,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Chip(
                    backgroundColor: AppColors.primaryW25,
                    label: Text(
                      appData.price,
                      style: TextStyle(
                        color: AppColors.primaryW600,
                      ),
                    )),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 17.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AppRatingsWidget(
                  ratings: appData.avgRatings,
                ),
              ),
              Text(
                appData.numRatings.toString(),
                style: TextStyle(
                  fontFamily: 'Euclid Circular B',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyW900,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class AppRatingsWidget extends StatelessWidget {
  const AppRatingsWidget({Key? key, required this.ratings}) : super(key: key);

  final double ratings;

  @override
  Widget build(BuildContext context) {
    const starSize = 18.0;

    int getFractionalPart() {
      return ratings.toInt();
    }

    int getUnfilledPart() {
      return 5 - ratings.round();
    }

    double getDecimalPart() {
      return ratings - ratings.truncate();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          getFractionalPart(),
          (index) => Icon(Icons.star, color: AppColors.orange, size: starSize),
        ),
        if (getDecimalPart() > 0)
          Icon(Icons.star_half, color: AppColors.orange, size: starSize),
        ...List.generate(
          getUnfilledPart(),
          (index) =>
              Icon(Icons.star_outline, color: AppColors.orange, size: starSize),
        ),
      ],
    );
  }
}

class InstallButtonWidget extends StatelessWidget {
  const InstallButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String installIcon = 'assets/icons/install.svg';

    return SizedBox(
      height: 36.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryW500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () => {},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                "Install",
                style: TextStyle(
                  fontFamily: 'Euclid Circular B',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SvgPicture.asset(
              installIcon,
              width: 12,
              height: 12,
              color: Colors.white,
              semanticsLabel: 'Install icon',
            ),
          ],
        ),
      ),
    );
  }
}