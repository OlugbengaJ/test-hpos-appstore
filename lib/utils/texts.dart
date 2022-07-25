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
  static const String discoverMore = 'Discover more';
  static const String suggestedProductivity = 'Top productivity apps';
  static const String suggestedPaid = 'Top paid apps';
  static const String seeAll = 'See all';
  static const String install = 'Install';
  static const String free = 'Free';
  static const String currencySymbol = 'Free';
}
