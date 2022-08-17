import 'package:flutter/material.dart';
import 'package:hpos_app_store/hpos_app_store.dart' as lib;
import 'package:hpos_appstore/models/product_model.dart';

class ProductMapper {
  Product productFromDto(lib.AppMetadata appMetadata) {
    return Product(
      id: appMetadata.id,
      name: appMetadata.label,
      category: appMetadata.category,
      description: appMetadata.description,
      longDescription: appMetadata.longDescription,
      logo: appMetadata.iconUrl,
      price: '0',
      avgRatings: appMetadata.rating.toDouble(),
      numRatings: 34,
      applicationInfo: infoFromDto(appMetadata),
    );
  }

  ApplicationInfo infoFromDto(lib.AppMetadata appMetadata) {
    return ApplicationInfo(
        packageFormat: appMetadata.format,
        formatHandle: appMetadata.formatHandle,
        size: appMetadata.size.toInt(),
        updateAvailable: appMetadata.updateStatus,
        supportedVersions: appMetadata.supportedVersions,
        creationDate: appMetadata.creationDate,
        lastUpdatedDate: appMetadata.lastUpdateDate,
        installationStatus: installationFromDto(appMetadata.installationStatus),
        installedVersion: appMetadata.installedVersion,
        appRequirements: requirementsFromDto(appMetadata));
  }

  ApplicationRequirements requirementsFromDto(lib.AppMetadata appMetadata) {
    return ApplicationRequirements(
      requiredRam: appMetadata.requiredRam,
      requiredDisk: appMetadata.requiredDisk,
      requiredProcessorMHz: appMetadata.requiredBandwidth,
      requiredOSVersion: '3.0.1',
      requiredScreenSize: const Size(10, 20),
    );
  }

  static lib.AppId? getAppId(Product? product) {
    if (product == null) return null;

    final lib.AppMetadata appMetadata = ProductMapper().productToDto(product);
    return lib.AppId.fromMetadata(appMetadata);
  }

  lib.AppMetadata productToDto(Product product) {
    return lib.AppMetadata(
      product.id,
      product.logo,
      product.name,
      product.applicationInfo?.packageFormat ?? 'Unknown',
      product.applicationInfo?.formatHandle ?? 'Unknown',
      product.category,
      product.description,
      product.applicationInfo?.supportedVersions ?? [],
      product.screenShots,
      product.applicationInfo?.creationDate ?? DateTime.now(),
      product.applicationInfo?.lastUpdatedDate ?? DateTime.now(),
      installationToDto(product.applicationInfo?.installationStatus),
      product.applicationInfo?.installedVersion ?? '',
      product.applicationInfo?.updateAvailable ?? false,
      product.developer,
      product.avgRatings,
      BigInt.from(product.applicationInfo?.size ?? 0),
      product.longDescription,
      product.languages,
      product.parentalGuidanceAge.toString(),
      product.applicationInfo?.appRequirements?.requiredRam ?? BigInt.zero,
      product.applicationInfo?.appRequirements?.requiredDisk ?? BigInt.zero,
      product.applicationInfo?.appRequirements?.requiredProcessorMHz ??
          BigInt.zero,
      product.tags,
      [product.applicationInfo?.appRequirements?.requiredOSVersion ?? ''],
      product.applicationInfo?.appRequirements?.requiredScreenSize?.height
              .ceil() ??
          0,
      product.applicationInfo?.appRequirements?.requiredScreenSize?.width
              .ceil() ??
          0,
    );
  }

  InstallationStatus installationFromDto(lib.InstallationStatus status) {
    return status == lib.InstallationStatus.installed
        ? InstallationStatus.installed
        : InstallationStatus.notInstalled;
  }

  lib.InstallationStatus installationToDto(InstallationStatus? status) {
    return status == InstallationStatus.installed
        ? lib.InstallationStatus.installed
        : lib.InstallationStatus.notInstalled;
  }
}
