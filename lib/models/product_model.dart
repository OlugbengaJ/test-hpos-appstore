class Product {
  final BigInt id;
  final String description;
  final String longDescription;
  final List<String> screenShots;
  final List<String> tags;
  final ApplicationInfo? applicationInfo;

  final String logo;
  final String name;
  final String category;
  final String price; // missing in the library
  final double avgRatings; // missing all ratings.
  final int numRatings;
  final int minAge; // missing in the library
  final String developer;
  final List<String> languages;
  final int parentalGuidanceAge;

  Product({
    required this.id,
    required this.description,
    this.longDescription = '',
    this.screenShots = const [] ,
    this.tags = const [],
    this.logo = '',
    required this.name,
    required this.category,
    required this.price,
    this.avgRatings = 0,
    this.numRatings = 0,
    this.minAge = 0,
    this.developer = '',
    this.languages = const [],
    this.parentalGuidanceAge = 12,
    this.applicationInfo,
  });
}

class SuggestedApps {
  final String tag;
  final List<Product> products;

  SuggestedApps(this.tag, this.products);
}

class ProductFilterTag {
  final int id;
  final String name;
  final String slug;

  ProductFilterTag(this.id, this.name, this.slug);
}

enum InstallationStatus { notInstalled, installed }

class ApplicationInfo extends ProductInfo {
  final String packageFormat;
  final String formatHandle;
  final int size;
  final bool updateAvailable;
  final List<String>? supportedVersions;
  final DateTime? creationDate;
  final DateTime? lastUpdatedDate;
  final InstallationStatus installationStatus;
  final String installedVersion;
  final ApplicationRequirements? appRequirements;

  ApplicationInfo({
    this.packageFormat = 'deb',
    this.formatHandle = '',
    this.size = 54,
    this.updateAvailable = false,
    this.supportedVersions,
    this.creationDate,
    this.lastUpdatedDate,
    this.installationStatus = InstallationStatus.notInstalled,
    this.installedVersion = '',
    this.appRequirements,
  });
}

class ApplicationRequirements {
  final String? requiredOSVersion;
  final BigInt? requiredRam;
  final BigInt? requiredDisk;
  final BigInt? requiredBandwidth;
  final BigInt? requiredProcessorMHz;

  ApplicationRequirements({
    this.requiredOSVersion,
    this.requiredRam,
    this.requiredDisk,
    this.requiredBandwidth,
    this.requiredProcessorMHz
  });
}

abstract class ProductInfo {}