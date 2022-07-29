import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';

class LibraryProvider extends ChangeNotifier {
  LibraryProducts appView = LibraryProducts.all;
  String filterTag = 'all';

  var displayType = ValueNotifier(LibraryDisplay.grid);

  setAppView(LibraryProducts choice) {
    appView = choice;
    notifyListeners();
  }

  setFilterTag(String choice) {
    filterTag = choice;
    notifyListeners();
  }

  List<Product> getFilterData(String categoryName) {
    return [
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Microsoft Teams',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
          'Google Meet',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Zoom',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
          'Google Suite',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Microsoft Teams',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
          'Google Meet',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Zoom',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
          'Google Suite',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Microsoft Teams',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
          'Google Meet',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Zoom',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
          'Google Suite',
          'Productivity',
          'Free',
          4.5,
          70)
    ];
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
