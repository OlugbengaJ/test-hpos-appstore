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
  static String homeBannerText1 = 'Let\'s get you into all the goodness';
  static String homeBannerText2 = 'on the hp App Store';
  static String discoverMore = 'Discover more';
}
