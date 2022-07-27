/// [AppAssets] contains image values that are repeated throughout the app.
/// It is central bucket where you define static values once
///
/// e.g. you can define a constant variable as follows
///
/// static String profilePng = 'assets/profile.jpg';
///
/// You then reference [AppAssets].profilePng in other parts of the app
/// where the value is needed.
///
/// This approach makes refactoring quick and error free.
/// Also, for localization, you have a central place to do just that.
class AppAssets {
  static String bannerAppsPng = 'assets/images/banner_apps.png';
  static String helpPng = 'assets/icons/help.png';
  static String homePng = 'assets/icons/home.png';
  static String hpLogoPng = 'assets/images/hp_logo.png';
  static String laptopPng = 'assets/icons/laptop.png';
}
