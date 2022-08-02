class Product {
  final String logo;
  final String name;
  final String category;
  final String price;
  final double avgRatings;
  final int numRatings;
  final bool updateAvailable;
  final int size;
  final int minAge;
  final String developer;
  final String language;
  final int parentalGuidanceAge;

  Product(
    this.logo,
    this.name,
    this.category,
    this.price,
    this.avgRatings,
    this.numRatings,
    this.updateAvailable,
    this.size,
    this.minAge,
    this.developer,
    this.language,
    this.parentalGuidanceAge,
  );
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
