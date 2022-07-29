import 'dart:ffi';

class Product {
  final String logo;
  final String name;
  final String category;
  final String price;
  final double avgRatings;
  final int numRatings;

  Product(this.logo, this.name, this.category, this.price, this.avgRatings,
      this.numRatings);
}

class SuggestedApps {
  final String tag;
  final List<Product> products;

  SuggestedApps(this.tag, this.products);
}

class ProductFilterTag {
  final int id;
  final String name;
  final String slug;

  ProductFilterTag(this.id, this.name, this.slug);
}
