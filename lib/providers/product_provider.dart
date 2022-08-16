import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/utils/languages.dart';
import 'package:hpos_appstore/utils/physical_device_config.dart';
import 'package:hpos_appstore/utils/texts.dart';

class ProductProvider extends ChangeNotifier {
  PhysicalDeviceConfig? deviceConfig;

  var productId = BigInt.zero;
  final nameNotifier = ValueNotifier('Microsoft Teams');
  final categoryNotifier = ValueNotifier('Productivity');
  final descriptionNotifier = ValueNotifier('');
  final ratingNotifier = ValueNotifier(3.0);
  final reviewerCountNotifier = ValueNotifier(70);
  final priceNotifier = ValueNotifier('\$48.99');
  final imageNotifier = ValueNotifier(
      'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg');
  final sizeNotifier = ValueNotifier(148);
  final minAgeNotifier = ValueNotifier(4);
  final developerNotifier = ValueNotifier('Microsoft Inc');
  final languageNotifier = ValueNotifier(Languages.locales.first);
  final appRequirementsNotifier = ValueNotifier<ApplicationRequirements?>(
      ApplicationRequirements(requiredOSVersion: '3.0.1'));
  final supportedLanguagesNotifier = ValueNotifier(Languages.locales);
  final parentalGuidanceAgeNotifier = ValueNotifier(12);
  final installationStatus = ValueNotifier(InstallationStatus.notInstalled);
  var minRating = 1;
  var maxRating = 5;

  /// Holds a copy of the original value from the product
  final productValueNotifier = ValueNotifier<Product?>(null);

  ProductProvider(BuildContext context)
      : deviceConfig = PhysicalDeviceConfig(context);

  ProductProvider.fromModel(Product product) {
    // need to persist for later use e.g. to generate shared links.
    productValueNotifier.value = product.copyWith();

    productId = product.id;
    name = product.name;
    category = product.category;
    description = product.description;
    rating = product.avgRatings;
    reviewerCount = product.numRatings;
    price = double.tryParse(product.price) ?? 0;
    image = product.logo;
    size = product.applicationInfo?.size ?? 0;
    minAge = product.minAge;
    developer = product.developer;
    supportedLanguages = product.languages;
    parentalGuidanceAge = product.parentalGuidanceAge;
    appRequirements = product.applicationInfo?.appRequirements;
    installationStatus.value = product.applicationInfo?.installationStatus ??
        InstallationStatus.notInstalled;

    if (product.applicationInfo != null) {
      product.applicationInfo?.subscribeForInstallationStatus(
          (status) => installationStatus.value = status);
    }
  }

  String get name => nameNotifier.value;

  set name(String name) => nameNotifier.value = name;

  String get category => categoryNotifier.value;

  set category(String category) => categoryNotifier.value = category;

  String get description => descriptionNotifier.value;

  set description(String description) => descriptionNotifier.value = description;

  double get rating => ratingNotifier.value;

  set rating(double rating) {
    if (rating < minRating || rating > maxRating) return;
    // TODO: Call dart library here to update ratings
    ratingNotifier.value = rating;
  }

  int get reviewerCount => reviewerCountNotifier.value;

  set reviewerCount(int count) => reviewerCountNotifier.value = count;

  double get price => double.tryParse(priceNotifier.value) ?? 0;

  set price(double price) =>
      priceNotifier.value = price > 0 ? priceNotifier.value : AppTexts.free;

  String get image => imageNotifier.value;

  set image(String image) => imageNotifier.value = image;

  int get size => sizeNotifier.value;

  set size(int size) => sizeNotifier.value = size;

  int get minAge => minAgeNotifier.value;

  set minAge(int age) => minAgeNotifier.value = age;

  String get developer => developerNotifier.value;

  set developer(String developer) => developerNotifier.value = developer;

  String get language => languageNotifier.value;

  set language(String language) => languageNotifier.value = language;

  int get supportedLanguagesCount => supportedLanguagesNotifier.value.length;

  int get parentalGuidanceAge => parentalGuidanceAgeNotifier.value;

  set parentalGuidanceAge(int age) => parentalGuidanceAgeNotifier.value = age;

  List<String> get supportedLanguages => supportedLanguagesNotifier.value;

  set supportedLanguages(List<String> languages) =>
      supportedLanguagesNotifier.value = languages;

  ApplicationRequirements? get appRequirements => appRequirementsNotifier.value;

  set appRequirements(ApplicationRequirements? applicationRequirements) =>
      appRequirementsNotifier.value = applicationRequirements;

  bool get osVersionMatches =>
      deviceConfig?.osVersion ==
      appRequirementsNotifier.value?.requiredOSVersion;

  bool get memoryCapacityMatches =>
      deviceConfig?.systemMem ==
      appRequirementsNotifier.value?.requiredRam?.toInt();

  bool get diskSpaceMatches =>
      deviceConfig?.systemDisk ==
      appRequirementsNotifier.value?.requiredDisk?.toInt();

  bool get processorMatches =>
      deviceConfig?.systemProcessorMHz ==
      appRequirementsNotifier.value?.requiredProcessorMHz?.toInt();

  bool get screenDimensionMatches =>
      deviceConfig?.screenDimension?.width ==
          appRequirementsNotifier.value?.requiredScreenSize?.width &&
      deviceConfig?.screenDimension?.height ==
          appRequirementsNotifier.value?.requiredScreenSize?.height;
}
