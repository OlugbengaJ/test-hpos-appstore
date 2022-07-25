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
  final List<Product> apps;

  SuggestedApps(this.tag, this.apps);
}
