import 'package:flutter/material.dart';

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
    this.screenShots = const [],
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

enum InstallationStatus { notInstalled, installed }

class ApplicationInfo extends ProductInfo {
  final String packageFormat;
  final String formatHandle;
  final int size;
  final bool updateAvailable;
  final List<String>? supportedVersions;
  final DateTime? creationDate;
  final DateTime? lastUpdatedDate;
  InstallationStatus _installationStatus;
  final String installedVersion;
  final ApplicationRequirements? appRequirements;
  final List<Function> installationListeners = [];

  ApplicationInfo({
    this.packageFormat = 'deb',
    this.formatHandle = '',
    this.size = 54,
    this.updateAvailable = false,
    this.supportedVersions,
    this.creationDate,
    this.lastUpdatedDate,
    InstallationStatus installationStatus = InstallationStatus.notInstalled,
    this.installedVersion = '',
    this.appRequirements,
  }) : _installationStatus = installationStatus;

  InstallationStatus get installationStatus => _installationStatus;

  set installationStatus(InstallationStatus status) {
    if (_installationStatus != status) {
      _installationStatus = status;
      for (var listener in installationListeners) {
        listener(_installationStatus);
      }
    }
  }

  void subscribeForInstallationStatus(Function(InstallationStatus) listener) {
    installationListeners.add(listener);
  }
}

class ApplicationRequirements {
  final String requiredOSVersion;
  final BigInt? requiredRam;
  final BigInt? requiredDisk;
  final BigInt? requiredProcessorMHz;
  final Size? requiredScreenSize;

  ApplicationRequirements(
      {required this.requiredOSVersion,
      this.requiredRam,
      this.requiredDisk,
      this.requiredProcessorMHz,
      this.requiredScreenSize});
}

abstract class ProductInfo {}
