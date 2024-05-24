import 'dart:math';

class Helpers {
  static List<T> shuffleList<T>(List<T> list) {
    final random = Random();
    for (int i = list.length - 1; i > 0; i--) {
      final n = random.nextInt(i + 1);
      final temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
    return list;
  }
}
