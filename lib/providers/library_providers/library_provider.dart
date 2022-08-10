import 'package:flutter/material.dart';
import 'package:hpos_appstore/interactors/interactor_fetch_applications.dart';
import 'package:hpos_appstore/interactors/interactor_fetch_categories.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';

class LibraryProvider extends ChangeNotifier {
  LibraryProducts appView = LibraryProducts.all;
  ValueNotifier<String> filterTagNotifier = ValueNotifier('All');
  ValueNotifier<List<Product>> products = ValueNotifier([]);
  ValueNotifier<List<String>> categories = ValueNotifier([]);
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

  String get filterTag {
    return filterTagNotifier.value;
  }

  set filterTag(String choice) {
    filterTagNotifier.value = choice;
    notifyListeners();
  }

  List<String> removeFilterTag(String name) {
    return [];
  }
}
