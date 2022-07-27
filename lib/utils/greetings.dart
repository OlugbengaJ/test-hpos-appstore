class Greetings {
  static String get now {
    final time = DateTime.now();

    if (time.hour >= 0 && time.hour < 12) {
      return 'Good morning';
    }

    if (time.hour >= 12 && time.hour < 16) {
      return 'Good afternoon';
    }

    return 'Good evening';
  }
}
