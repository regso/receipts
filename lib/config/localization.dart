import 'dart:math';

class Localization {
  static String getMorph(int n, List<String> threeTitles) {
    List<int> cases = [2, 0, 1, 1, 1, 2];
    return threeTitles[
        (n % 100 > 4 && n % 100 < 20) ? 2 : cases[min(n % 10, 5)]];
  }
}
