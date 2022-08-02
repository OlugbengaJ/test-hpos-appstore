import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/utils/texts.dart';

class ProductProvider extends ChangeNotifier {
  final nameNotifier = ValueNotifier('Microsoft Teams');
  final categoryNotifier = ValueNotifier('Productivity');
  final ratingNotifier = ValueNotifier(3.0);
  final reviewerCountNotifier = ValueNotifier(70);
  final priceNotifier = ValueNotifier('\$48.99');
  final imageNotifier = ValueNotifier(
      'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg');
  final sizeNotifier = ValueNotifier(148);
  final minAgeNotifier = ValueNotifier(4);
  final developerNotifier = ValueNotifier('Microsoft Inc');
  final languageNotifier = ValueNotifier('EN');
  final supportedLanguages = ValueNotifier(['AR', 'FR', 'DE', 'JP', 'ZH', 'SP', 'IT', 'RU', 'BS', 'MY', 'ET', 'FA', 'HI', 'ID', 'SW', 'TR']);
  final parentalGuidanceAgeNotifier = ValueNotifier(12);
  var minRating = 1;
  var maxRating = 5;

  ProductProvider();

  ProductProvider.fromModel(Product product) {
    name = product.name;
    category = product.category;
    rating = product.avgRatings;
    reviewerCount = product.numRatings;
    price = double.tryParse(product.price) ?? 0;
    image = product.logo;
    size = product.size;
    minAge = product.minAge;
    developer = product.developer;
    language = product.language;
    parentalGuidanceAge = product.parentalGuidanceAge;
  }

  String get name => nameNotifier.value;

  set name(String name) => nameNotifier.value = name;

  String get category => categoryNotifier.value;

  set category(String category) => categoryNotifier.value = category;

  double get rating => ratingNotifier.value;

  set rating(double rating) {
    if (rating < minRating || rating > maxRating) return;
    ratingNotifier.value = rating;
  }

  int get reviewerCount => reviewerCountNotifier.value;

  set reviewerCount(int count) => reviewerCountNotifier.value = count;

  double get price => double.tryParse(priceNotifier.value) ?? 0;

  set price(double price) =>
      priceNotifier.value = price > 0 ? priceNotifier.value : AppTexts.free;

  String get image => imageNotifier.value;

  set image(String image) => imageNotifier.value = image;

  int get size => sizeNotifier.value;

  set size(int size) => sizeNotifier.value = size;

  int get minAge => minAgeNotifier.value;

  set minAge(int age) => minAgeNotifier.value = age;

  String get developer => developerNotifier.value;

  set developer(String developer) => developerNotifier.value = developer;

  String get language => languageNotifier.value;

  set language(String language) => languageNotifier.value = language;

  int get supportedLanguagesCount => supportedLanguages.value.length;

  int get parentalGuidanceAge => parentalGuidanceAgeNotifier.value;

  set parentalGuidanceAge(int age) => parentalGuidanceAgeNotifier.value = age;
}
