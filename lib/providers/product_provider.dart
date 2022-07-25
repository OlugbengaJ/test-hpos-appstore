import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/utils/texts.dart';

class ProductProvider extends ChangeNotifier {
  final nameNotifier = ValueNotifier('Microsoft Teams');
  final categoryNotifier = ValueNotifier('Productivity');
  final ratingNotifier = ValueNotifier(3.0);
  final reviewerCountNotifier = ValueNotifier(70);
  final priceNotifier = ValueNotifier('\$48.99');
  final imageNotifier = ValueNotifier(
      'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg');
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
}
