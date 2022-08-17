import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/size_helper.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:provider/provider.dart';

class OtherInformationsCard extends StatefulWidget {
  const OtherInformationsCard({Key? key}) : super(key: key);

  @override
  State<OtherInformationsCard> createState() => _OtherInformationsCardState();
}

class _OtherInformationsCardState extends State<OtherInformationsCard> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return PhysicalModel(
      color: AppColors.greyW25,
      borderRadius: BorderRadius.circular(16),
      elevation: 0.5,
      child: Container(
        height: 276,
        padding: const EdgeInsets.only(left: 35, top: 43),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 58),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.provider,
                      child: SizedBox(
                        child: ValueListenableBuilder<String>(
                          valueListenable: productProvider.developerNotifier,
                          builder: (context, value, child) => Text(
                            value.isEmpty ? 'Unknown' : value,
                            style: const TextStyle(
                                color: AppColors.primaryW500,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.size,
                      child: SizedBox(
                        child: ValueListenableBuilder<int>(
                          valueListenable: productProvider.sizeNotifier,
                          builder: (context, value, child) => Text(
                            SizeHelper.getSize(value).toString(),
                            style: const TextStyle(
                                color: AppColors.greyW700,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.category,
                      child: SizedBox(
                        child: ValueListenableBuilder<String>(
                          valueListenable: productProvider.categoryNotifier,
                          builder: (context, value, child) => Text(
                            value,
                            style: const TextStyle(
                                color: AppColors.greyW700,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 25,
                    child: InfoCard(
                      title: AppTexts.latestVersion,
                      child: SizedBox(
                        child: Text(
                          "12.564",
                          style: TextStyle(
                              color: AppColors.greyW700,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 25,
                  child: InfoCard(
                    title: AppTexts.releasedDate,
                    child: SizedBox(
                      child: Text(
                        "22/07/2004",
                        style: TextStyle(
                            color: AppColors.greyW700,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 25,
                  child: InfoCard(
                    title: AppTexts.languages,
                    child: SizedBox(
                      child: Text(
                        "English +10 more",
                        style: TextStyle(
                            color: AppColors.greyW700,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
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
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            "Terms of service",
                            style: TextStyle(
                                color: AppColors.primaryW500,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.title, required this.child})
      : super(key: key);
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
                color: AppColors.greyW400,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),
        Container(
          child: child,
        )
      ],
    );
  }
}
