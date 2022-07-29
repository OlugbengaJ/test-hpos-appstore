/// [AppTexts] contains texts that are often repeated throughout the app.
/// It is central bucket where you define static values once
///
/// e.g. you can define a constant variable as follows
///
/// static String closeText = 'close';
///
/// You then reference [AppTexts].closeText in other parts of the app
/// where the value is needed.
///
/// This approach makes refactoring quick and error free.
/// Also, for localization, you have a central place to do just that.
class AppTexts {
  static const String homeBannerText1 = 'Let\'s get you into all the goodness';
  static const String homeBannerText2 = 'on the hp App Store';
  static const String discoverMore = 'Discover more 🚀';
  static const String search = 'Search through apps, games, and more';
  static const String suggestedProductivity = 'Top productivity apps';
  static const String suggestedPaid = 'Top paid apps';
  static const String suggestedGames = 'Top paid games';
  static const String suggestedNew = 'Top new apps';
  static const String seeAll = 'See all';
  static const String install = 'Install';
  static const String installed = 'Installed';
  static const String uninstall = 'Uninstall';
  static const String free = 'Free';
  static const String share = 'share';
  static const String systemRequirements = 'System requirements';
  static const String systemRequirementsMessage = 'This application should work on your device. Items with a tick meets the developer’s system requirments';
  static const String similarAppSugestions = 'Similar App Suggestions';
  static const String ratingsReviews = 'Ratings and Reviews';
  static const String appScreenshots = 'App screenshots';
  static const String showMore = 'Show more';
}
