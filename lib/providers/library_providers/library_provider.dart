import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';

class LibraryProvider extends ChangeNotifier {
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

  getTags() {
    return [];
  }
}
