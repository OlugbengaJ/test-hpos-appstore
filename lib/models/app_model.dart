class AppModel {
  final String logo;
  final String name;
  final String category;
  final String price;
  final double avgRatings;
  final int numRatings;

  AppModel(this.logo, this.name, this.category, this.price, this.avgRatings,
      this.numRatings);
}

class SuggestedApps{
  final String tag;
  final List<AppModel> apps;

  SuggestedApps(this.tag, this.apps);
}