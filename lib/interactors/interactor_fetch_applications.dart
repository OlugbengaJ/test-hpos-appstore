import 'dart:async';

import 'package:hpos_app_store/hpos_app_store.dart';
import 'package:hpos_appstore/mappers/product_mapper.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';

class InteractorFetchApps {
  static final productMapper = ProductMapper();

  Future requestAllApps(LibraryProvider provider) async {
    final apps = await listAvailableApplications().then((applications) =>
        applications.map((app) => productMapper.productFromDto(app)));

    provider.products = apps.toList();
  }

  /// Returns a [Future] of [Product]s in a category.
  static Future<List<Product>> appsInCategory(String category,
      [int pageSize = 20]) async {
    // call this to load all apps else getTopAppsForCategory() does not work
    await listAvailableApplications();

    return await Future(() async {
      final appMetadata = getTopAppsForCategory(category, pageSize);
      final apps = appMetadata.map((app) => productMapper.productFromDto(app));

      return [...apps];
    });
  }
}
