import 'package:flutter/material.dart';
import 'package:hpos_appstore/interactors/interactor_fetch_applications.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';

class LibraryProvider extends ChangeNotifier {
  LibraryProducts appView = LibraryProducts.all;
  String filterTag = 'all';
  ValueNotifier<List<Product>> products = ValueNotifier([]);
  InteractorFetchApps interactor = InteractorFetchApps();

  LibraryProvider() {
    interactor.requestAllApps(this);
  }

  var displayType = ValueNotifier(LibraryDisplay.grid);

  setAppView(LibraryProducts choice) {
    appView = choice;
    notifyListeners();
  }

  setFilterTag(String choice) {
    filterTag = choice;
    notifyListeners();
  }

  List<ProductFilterTag> getTags() {
    return [
      ProductFilterTag(1, 'All', 'all'),
      ProductFilterTag(2, 'Games', 'games'),
      ProductFilterTag(3, 'Entertainment', 'entertainment'),
      ProductFilterTag(4, 'Utilities', 'utilities'),
      ProductFilterTag(5, 'Team Collaboration', 'team_collaboration'),
      ProductFilterTag(6, 'Software Dev Tools', 'software_dev_tools'),
      ProductFilterTag(7, 'Freelancer Tools', 'freelancer_tools'),
      ProductFilterTag(8, 'Social Media', 'social_media'),
      ProductFilterTag(9, 'Free', 'free'),
      ProductFilterTag(10, 'Paid', 'paid')
    ];
  }

  List<ProductFilterTag> removeFilterTag(int tagId) {
    return [];
  }
}
