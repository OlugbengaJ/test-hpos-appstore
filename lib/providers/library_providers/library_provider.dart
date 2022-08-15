import 'package:flutter/material.dart';
import 'package:hpos_appstore/interactors/interactor_fetch_applications.dart';
import 'package:hpos_appstore/interactors/interactor_fetch_categories.dart';
import 'package:hpos_appstore/mappers/product_mapper.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';

class LibraryProvider extends ChangeNotifier {
  LibraryProducts appView = LibraryProducts.all;
  ValueNotifier<String> filterTagNotifier = ValueNotifier('All');
  ValueNotifier<List<Product>> productsNotifier = ValueNotifier([]);
  ValueNotifier<List<String>> categories = ValueNotifier([]);
  ValueNotifier<List<String>> homeCategories = ValueNotifier([]);
  ValueNotifier<List<Product>> filteredProductsNotifier = ValueNotifier([]);
  ValueNotifier<bool> loadingNotifier = ValueNotifier(false);
  InteractorFetchApps appsInteractor = InteractorFetchApps();
  InteractorFetchCategories categoriesInteractor = InteractorFetchCategories();

  LibraryProvider() {
    categoriesInteractor.requestAllCategories(this);
    appsInteractor.requestAllApps(this);
  }

  var displayType = ValueNotifier(LibraryDisplay.grid);

  setAppView(LibraryProducts choice) {
    appView = choice;
    notifyListeners();
  }

  List<Product> get products => productsNotifier.value;

  set products(List<Product> products) {
    productsNotifier.value = products;
    _applyFilter();
  }

  String get filterTag => filterTagNotifier.value;

  set filterTag(String choice) {
    filterTagNotifier.value = choice;
    loadingNotifier.value = true;
    // give sometime for the listener to update the screen before passing the new list
    Future.delayed(const Duration(milliseconds: 60), _applyFilter);
    notifyListeners();
  }

  Future _applyFilter() async {
    filteredProductsNotifier.value = (filterTag == 'All' || filterTag.isEmpty)
        ? List.from(productsNotifier.value)
        : List.from(
            productsNotifier.value.where(
              (product) => product.category == filterTag,
            ),
          );
    loadingNotifier.value = false;
  }

  List<String> removeFilterTag(String name) {
    return [];
  }

  Future install(BigInt applicationId) async {
    Product app = products.firstWhere((element) => element.id == applicationId);
    if (app.applicationInfo == null) {
      throw MissingAppInfoException();
    }

    await ProductMapper.getAppId(app)?.install();
    app.applicationInfo!.installationStatus = InstallationStatus.installed;
  }

  Future uninstall(BigInt applicationId) async {
    Product app = products.firstWhere((element) => element.id == applicationId);
    if (app.applicationInfo == null) {
      throw MissingAppInfoException();
    }

    await ProductMapper.getAppId(app)?.remove();
    app.applicationInfo!.installationStatus = InstallationStatus.notInstalled;
  }

  /// Returns list of [Product]s in a category.
  List<Product> appsInCategory(String category, [int pageSize = 10]) {
    // return data from previously loaded
    final apps = products
        .where((product) => product.category == category)
        .take(pageSize);

    return [...apps];
  }
}

class MissingAppInfoException implements Exception {}
