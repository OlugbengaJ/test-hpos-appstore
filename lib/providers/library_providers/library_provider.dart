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
        id: BigInt.zero,
        logo:
            'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        name: 'Microsoft Teams',
        description: '',
        category: 'Productivity',
        price: 'Free',
        avgRatings: 3.5,
        numRatings: 70,
        minAge: 4,
        developer: 'Microsoft Inc',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: true,
          size: 47,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
        name: 'Google Meet',
        description: '',
        category: 'Productivity',
        price: 'Free',
        avgRatings: 4.5,
        numRatings: 70,
        minAge: 12,
        developer: 'Google',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 47,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        name: 'Zoom',
        description: '',
        category: 'Productivity',
        price: 'Free',
        minAge: 8,
        avgRatings: 4.0,
        numRatings: 70,
        developer: 'Zoom.us',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 35,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
        name: 'Google Suite',
        description: '',
        category: 'Productivity',
        price: 'Free',
        minAge: 8,
        avgRatings: 4.5,
        numRatings: 70,
        developer: 'Google',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 104,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        name: 'Microsoft Teams',
        description: '',
        category: 'Productivity',
        price: 'Free',
        minAge: 12,
        avgRatings: 4.5,
        numRatings: 70,
        developer: 'Microsoft Inc',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 241,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
        name: 'Google Meet',
        description: '',
        category: 'Productivity',
        price: 'Free',
        avgRatings: 4.5,
        numRatings: 70,
        minAge: 12,
        developer: 'Google',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 54,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        name: 'Zoom',
        description: '',
        category: 'Productivity',
        price: 'Free',
        minAge: 8,
        avgRatings: 4.5,
        numRatings: 70,
        developer: 'Zoom.us',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 35,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
        name: 'Google Suite',
        description: '',
        category: 'Productivity',
        price: 'Free',
        minAge: 8,
        avgRatings: 4.5,
        numRatings: 70,
        developer: 'Google',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 205,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        name: 'Microsoft Teams',
        description: '',
        category: 'Productivity',
        price: 'Free',
        minAge: 13,
        avgRatings: 4.5,
        numRatings: 70,
        developer: 'Microsoft Inc',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 224,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
        name: 'Google Meet',
        description: '',
        category: 'Productivity',
        price: 'Free',
        minAge: 12,
        avgRatings: 4.5,
        numRatings: 70,
        developer: 'Google',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 45,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        name: 'Zoom',
        description: '',
        category: 'Productivity',
        price: 'Free',
        minAge: 12,
        avgRatings: 4.5,
        numRatings: 70,
        developer: 'Zoom.us',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 47,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
        name: 'Google Suite',
        description: '',
        category: 'Productivity',
        price: 'Free',
        avgRatings: 4.5,
        numRatings: 70,
        developer: 'Google',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 204,
        ),
      )
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

const supportedLanguages = [
  'AR',
  'FR',
  'DE',
  'JP',
  'ZH',
  'SP',
  'IT',
  'RU',
  'BS',
  'MY',
  'ET',
  'FA',
  'HI',
  'ID',
  'SW',
  'TR'
];
